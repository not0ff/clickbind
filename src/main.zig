//     Copyright (C) 2026-present  Not0ff
//
//     This program is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.
//
//     You should have received a copy of the GNU General Public License
//     along with this program.  If not, see <https://www.gnu.org/licenses/>.

const std = @import("std");
const builtin = @import("builtin");
const Allocator = std.mem.Allocator;
const Io = std.Io;
const linux = std.os.linux;
const posix = std.posix;

const zaudio = @import("zaudio");
const toml = @import("toml");

const kc = @import("keycodes.zig");

const InputEventsPath = "/dev/input/";
const ConfigPath = "config.toml";

const KEY_UP: u32 = 0x0;
const KEY_DOWN: u32 = 0x1;
const KEY_HOLD: u32 = 0x2;

const Keybind = struct {
    sound: []const u8,
    keys: []const []const u8,
};

const Config = struct {
    keybind: []const Keybind,
};

const InputEvent = extern struct {
    time: linux.timeval,
    type: u16,
    code: u16,
    value: u32,
};

const Ctx = struct {
    dev: Io.File,
    engine: *zaudio.Engine,
    bindmap: std.AutoHashMap(u16, [:0]const u8),
    mut: Io.Mutex,
};

inline fn EVIOCGBIT(ev: u8, comptime len: usize) u32 {
    return linux.IOCTL.IOR('E', 0x20 + ev, [len]u8);
}

fn deviceHasKeys(dev: Io.File) !bool {
    var evbit: usize = 0;
    const ret = linux.ioctl(dev.handle, EVIOCGBIT(0, @sizeOf(usize)), @intFromPtr(&evbit));
    if (ret < 0) return error.IoctlFailedCall;

    return evbit & (1 << kc.EV_KEY) != 0;
}

// Returned audio needs to be destroyed by the caller
fn playSound(engine: *zaudio.Engine, path: [:0]const u8) !*zaudio.Sound {
    const pb = try engine.createSoundFromFile(path, .{});
    errdefer pb.destroy();

    try pb.start();
    return pb;
}

fn handleEvent(event: InputEvent, ctx: Ctx, io: Io) error{Canceled}!void {
    if (event.type != kc.EV_KEY or event.value != KEY_DOWN) return;
    var mut = ctx.mut;

    try mut.lock(io);
    const sound = ctx.bindmap.get(event.code) orelse return;
    var pb = playSound(ctx.engine, sound) catch |err| {
        std.log.err("cannot play sound: {s}", .{@errorName(err)});
        mut.unlock(io);
        return;
    };
    mut.unlock(io);

    defer pb.destroy();
    while (pb.isPlaying()) try io.checkCancel();
}

fn listenOnDevice(ctx: Ctx, io: Io) !void {
    var f_buf: [32]u8 = undefined;
    var fr = ctx.dev.reader(io, &f_buf);
    var reader = &fr.interface;

    var group: Io.Group = .init;
    defer group.cancel(io);

    var buf: [@sizeOf(InputEvent)]u8 = undefined;
    while (true) {
        reader.readSliceAll(&buf) catch return error.Canceled;
        const event: InputEvent = @bitCast(buf);
        _ = group.concurrent(io, handleEvent, .{ event, ctx, io }) catch unreachable;
    }
}

// Returned slice needs to be freed and devices closed
fn getInputDevices(io: Io, alloc: Allocator) ![]Io.File {
    const ev_dir = try Io.Dir.openDirAbsolute(io, InputEventsPath, .{ .iterate = true });
    defer ev_dir.close(io);

    var devs: std.ArrayList(Io.File) = .empty;
    errdefer devs.deinit(alloc);

    var it = ev_dir.iterate();
    while (try it.next(io)) |ev| {
        if (ev.kind != .character_device) continue;
        const dev = try ev_dir.openFile(io, ev.name, .{ .follow_symlinks = true });
        errdefer dev.close(io);
        if (!(try deviceHasKeys(dev))) {
            dev.close(io);
            continue;
        }
        try devs.append(alloc, dev);
    }
    return devs.toOwnedSlice(alloc);
}

// Returned hash map and its values need to be freed by the caller.
fn getBindmap(io: Io, alloc: Allocator) !std.AutoHashMap(u16, [:0]const u8) {
    var parser: toml.Parser(Config) = .init(alloc);
    defer parser.deinit();

    var config = try parser.parseFile(io, "./config.toml");
    defer config.deinit();

    var bindmap: std.AutoHashMap(u16, [:0]const u8) = .init(alloc);
    errdefer bindmap.deinit();

    for (config.value.keybind) |kb| {
        for (kb.keys) |key| {
            const code = kc.codeFromName(key) orelse {
                std.log.warn("unknown key specified in keybind: {s}", .{key});
                continue;
            };
            const sound = try alloc.dupeSentinel(u8, kb.sound, 0x0);
            const res = try bindmap.getOrPut(code);
            if (res.found_existing) std.log.warn("keybind for {s} is already set. overwritting sound to {s}", .{ key, sound });
            res.value_ptr.* = sound;
        }
    }
    return bindmap;
}

var exit_sig: std.atomic.Value(bool) = .init(false);

export fn sig_handler(_: std.posix.SIG) callconv(.c) void {
    exit_sig.store(true, .release);
}

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const alloc = init.arena.allocator();

    zaudio.init(alloc);
    defer zaudio.deinit();

    const engine = try zaudio.Engine.create(null);
    defer engine.destroy();

    var io_impl: Io.Threaded = .init(alloc, .{});
    defer io_impl.deinit();
    const thread_io = io_impl.io();

    var group: Io.Group = .init;
    defer group.cancel(thread_io);

    // TODO: Listen only on devices that have keys specified in config
    const bindmap = try getBindmap(io, alloc);
    const devices = try getInputDevices(io, alloc);
    defer for (devices) |dev| dev.close(io);

    for (devices) |dev| {
        const ctx: Ctx = .{
            .dev = dev,
            .engine = engine,
            .bindmap = bindmap,
            .mut = .init,
        };
        _ = try group.concurrent(thread_io, listenOnDevice, .{ ctx, thread_io });
    }
    std.log.info("listening on {d} devices", .{devices.len});

    const sigact = posix.Sigaction{
        .handler = .{ .handler = sig_handler },
        .mask = std.posix.sigemptyset(),
        .flags = 0,
    };
    posix.sigaction(posix.SIG.INT, &sigact, null);

    while (!exit_sig.load(.acquire)) try io.sleep(.fromMilliseconds(10), .awake);
    group.cancel(thread_io);
    try group.await(thread_io);
}
