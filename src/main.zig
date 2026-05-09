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

const SoundQueue = std.PriorityQueue(*zaudio.Sound, void, comparePlaybacks);

const Keybind = struct {
    sound: []const u8,
    keys: []const []const u8,
};

const Config = struct {
    keybind: []const Keybind,
};

const Event = extern struct {
    time: linux.timeval,
    type: u16,
    code: u16,
    value: u32,
};

const HandlerCtx = struct {
    bindmap: Bindmap,
    engine: *zaudio.Engine,
    queue: *Io.Queue(Event),
    playbacks: *SoundQueue,
};

const Bindmap = struct {
    map: std.AutoHashMap(u16, *[:0]const u8),
    keycodes: []const u16,
    sounds: [][:0]const u8,

    fn init(keybinds: []const Keybind, alloc: Allocator) !Bindmap {
        var map: std.AutoHashMap(u16, *[:0]const u8) = .init(alloc);
        errdefer map.deinit();

        var keycodes: std.ArrayList(u16) = try .initCapacity(alloc, keybinds.len);
        errdefer keycodes.deinit(alloc);
        var sounds = try alloc.alloc([:0]const u8, keybinds.len);
        errdefer alloc.free(sounds);

        for (keybinds, 0..) |kb, i| {
            const sound: [:0]const u8 = try alloc.dupeSentinel(u8, kb.sound, 0x0);
            errdefer alloc.free(sound);
            sounds[i] = sound;

            for (kb.keys) |keyname| {
                const codes: []const u16 = blk: {
                    if (kc.keycodeFromName(keyname)) |code| break :blk &[_]u16{code};
                    break :blk kc.keycodesRangeFromName(keyname) orelse {
                        std.log.err("unknown key specified in keybind: {s}", .{keyname});
                        return error.UnknownKeyname;
                    };
                };
                try keycodes.appendSlice(alloc, codes);
                for (codes) |code| {
                    const res = try map.getOrPut(code);
                    if (res.found_existing) std.log.warn("keybind for {s} is already set. overwritting sound to {s}", .{ keyname, sound });
                    res.value_ptr.* = &sounds[i];
                }
            }
        }
        return .{
            .map = map,
            .keycodes = try keycodes.toOwnedSlice(alloc),
            .sounds = sounds,
        };
    }

    fn deinit(self: *Bindmap, alloc: Allocator) void {
        for (self.sounds) |s| alloc.free(s);
        alloc.free(self.sounds);
        alloc.free(self.keycodes);
        self.map.deinit();
    }

    fn getSoundForKeycode(self: Bindmap, code: u16) ?*[:0]const u8 {
        return self.map.get(code);
    }
};

inline fn EVIOCGBIT(ev: u8, comptime len: usize) u32 {
    return linux.IOCTL.IOR('E', 0x20 + ev, [len]u8);
}

inline fn bitsToLongs(x: comptime_int) comptime_int {
    return x + 8 * @sizeOf(usize) - 1 / (8 * @sizeOf(usize));
}

inline fn testBit(bits: []usize, bit: usize) bool {
    return (bits[bit / (8 * @sizeOf(usize))] >> @as(u6, @intCast(bit % (8 * @sizeOf(usize))))) & 1 == 1;
}

fn deviceHasAnyKeycode(handle: Io.File.Handle, codes: []const u16) !bool {
    var evbits: [bitsToLongs(kc.KEY_CNT)]usize = undefined;
    const ret = linux.ioctl(handle, EVIOCGBIT(kc.EV_KEY, evbits.len * @sizeOf(usize)), @intFromPtr(&evbits));
    if (ret < 0) return error.IoctlFailedCall;
    for (codes) |code| {
        if (testBit(&evbits, @intCast(code))) return true;
    }
    return false;
}

fn listenOnDevice(dev: Io.File, queue: *Io.Queue(Event), io: Io) error{Canceled}!void {
    var buf: [@sizeOf(Event)]u8 = undefined;
    var fr = dev.reader(io, &buf);
    var reader = &fr.interface;

    var data: [@sizeOf(Event)]u8 = undefined;
    while (true) {
        reader.readSliceAll(&data) catch return error.Canceled;
        const event: Event = @bitCast(data);
        if (event.type == kc.EV_KEY and event.value == kc.VAL_KEY_DOWN)
            queue.putOne(io, event) catch return error.Canceled;
    }
}

fn startPlayback(engine: *zaudio.Engine, path: [:0]const u8) !*zaudio.Sound {
    const pb = try engine.createSoundFromFile(path, .{});
    errdefer pb.destroy();

    try pb.start();
    return pb;
}

fn comparePlaybacks(_: void, s1: *zaudio.Sound, s2: *zaudio.Sound) std.math.Order {
    const t1 = s1.getTimeInPcmFrames();
    const t2 = s2.getTimeInPcmFrames();
    if (t1 > t2) return .lt;
    if (t1 < t2) return .gt;
    return .eq;
}

fn tidyPlaybacks(queue: *SoundQueue, alloc: Allocator) !void {
    var sounds: std.ArrayList(*zaudio.Sound) = try .initCapacity(alloc, queue.count());
    defer sounds.deinit(alloc);

    while (true) {
        const pb = queue.pop() orelse break;
        if (pb.isPlaying()) {
            try sounds.append(alloc, pb);
        } else {
            pb.destroy();
        }
    }
    for (sounds.items) |pb| try queue.push(alloc, pb);
}

fn handleEvents(ctx: HandlerCtx, io: Io, alloc: Allocator) error{Canceled}!void {
    var i: usize = 0;
    while (true) : (i += 1) {
        const event = ctx.queue.getOne(io) catch return error.Canceled;
        const sound = ctx.bindmap.getSoundForKeycode(event.code) orelse continue;

        const pb = startPlayback(ctx.engine, sound.*) catch |err| {
            std.log.err("cannot start playback: {s}", .{@errorName(err)});
            continue;
        };
        ctx.playbacks.push(alloc, pb) catch |err| {
            std.log.err("cannot enqueue playback: {s}", .{@errorName(err)});
            continue;
        };
        if (i % 30 == 0) {
            std.log.info("tidying playbacks..", .{});
            tidyPlaybacks(ctx.playbacks, alloc) catch |err| {
                std.log.err("cannot tidy playback queue: {s}", .{@errorName(err)});
            };
        }
    }
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
    errdefer group.cancel(thread_io);

    var parser: toml.Parser(Config) = .init(alloc);
    defer parser.deinit();
    var config = try parser.parseFile(io, "./config.toml");
    defer config.deinit();
    var bindmap: Bindmap = try .init(config.value.keybind, alloc);
    defer bindmap.deinit(alloc);

    const devices = blk: {
        var devs: std.ArrayList(Io.File) = .empty;
        errdefer devs.deinit(alloc);
        const dir = try Io.Dir.openDirAbsolute(io, "/dev/input/", .{ .iterate = true });
        defer dir.close(io);
        var it = dir.iterate();
        while (try it.next(io)) |entry| {
            if (entry.kind != .character_device) continue;
            var dev = try dir.openFile(io, entry.name, .{});
            errdefer dev.close(io);
            if (try deviceHasAnyKeycode(dev.handle, bindmap.keycodes)) {
                std.log.info("adding device {s}", .{entry.name});
                try devs.append(alloc, dev);
                continue;
            }
            dev.close(io);
        }
        break :blk try devs.toOwnedSlice(alloc);
    };
    defer alloc.free(devices);
    defer for (devices) |dev| dev.close(io);

    var buf: [32]Event = undefined;
    var queue: Io.Queue(Event) = .init(&buf);
    defer queue.close(io);
    for (devices) |dev|
        try group.concurrent(thread_io, listenOnDevice, .{ dev, &queue, thread_io });

    std.log.info("listening on {d} devices", .{devices.len});

    var playbacks: SoundQueue = .empty;
    defer playbacks.deinit(alloc);
    defer for (playbacks.items) |pb| pb.destroy();
    const ctx: HandlerCtx = .{
        .bindmap = bindmap,
        .engine = engine,
        .queue = &queue,
        .playbacks = &playbacks,
    };

    try group.concurrent(thread_io, handleEvents, .{ ctx, thread_io, alloc });

    const sigact = posix.Sigaction{
        .handler = .{ .handler = sig_handler },
        .mask = std.posix.sigemptyset(),
        .flags = 0,
    };
    posix.sigaction(posix.SIG.INT, &sigact, null);

    while (!exit_sig.load(.acquire)) try io.sleep(.fromMilliseconds(1), .awake);
    std.log.info("closing...", .{});
    group.cancel(thread_io);
    try group.await(thread_io);
}
