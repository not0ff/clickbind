const std = @import("std");

pub const INPUT_PROP_POINTER: u16 = 0x00;
pub const INPUT_PROP_DIRECT: u16 = 0x01;
pub const INPUT_PROP_BUTTONPAD: u16 = 0x02;
pub const INPUT_PROP_SEMI_MT: u16 = 0x03;
pub const INPUT_PROP_TOPBUTTONPAD: u16 = 0x04;
pub const INPUT_PROP_POINTING_STICK: u16 = 0x05;
pub const INPUT_PROP_ACCELEROMETER: u16 = 0x06;
pub const INPUT_PROP_PRESSUREPAD: u16 = 0x07;
pub const INPUT_PROP_MAX: u16 = 0x1f;
pub const INPUT_PROP_CNT: u16 = (INPUT_PROP_MAX + 1);
pub const EV_SYN: u16 = 0x00;
pub const EV_KEY: u16 = 0x01;
pub const EV_REL: u16 = 0x02;
pub const EV_ABS: u16 = 0x03;
pub const EV_MSC: u16 = 0x04;
pub const EV_SW: u16 = 0x05;
pub const EV_LED: u16 = 0x11;
pub const EV_SND: u16 = 0x12;
pub const EV_REP: u16 = 0x14;
pub const EV_FF: u16 = 0x15;
pub const EV_PWR: u16 = 0x16;
pub const EV_FF_STATUS: u16 = 0x17;
pub const EV_MAX: u16 = 0x1f;
pub const EV_CNT: u16 = (EV_MAX + 1);
pub const SYN_REPORT: u16 = 0;
pub const SYN_CONFIG: u16 = 1;
pub const SYN_MT_REPORT: u16 = 2;
pub const SYN_DROPPED: u16 = 3;
pub const SYN_MAX: u16 = 0xf;
pub const SYN_CNT: u16 = (SYN_MAX + 1);
pub const KEY_RESERVED: u16 = 0;
pub const KEY_ESC: u16 = 1;
pub const KEY_1: u16 = 2;
pub const KEY_2: u16 = 3;
pub const KEY_3: u16 = 4;
pub const KEY_4: u16 = 5;
pub const KEY_5: u16 = 6;
pub const KEY_6: u16 = 7;
pub const KEY_7: u16 = 8;
pub const KEY_8: u16 = 9;
pub const KEY_9: u16 = 10;
pub const KEY_0: u16 = 11;
pub const KEY_MINUS: u16 = 12;
pub const KEY_EQUAL: u16 = 13;
pub const KEY_BACKSPACE: u16 = 14;
pub const KEY_TAB: u16 = 15;
pub const KEY_Q: u16 = 16;
pub const KEY_W: u16 = 17;
pub const KEY_E: u16 = 18;
pub const KEY_R: u16 = 19;
pub const KEY_T: u16 = 20;
pub const KEY_Y: u16 = 21;
pub const KEY_U: u16 = 22;
pub const KEY_I: u16 = 23;
pub const KEY_O: u16 = 24;
pub const KEY_P: u16 = 25;
pub const KEY_LEFTBRACE: u16 = 26;
pub const KEY_RIGHTBRACE: u16 = 27;
pub const KEY_ENTER: u16 = 28;
pub const KEY_LEFTCTRL: u16 = 29;
pub const KEY_A: u16 = 30;
pub const KEY_S: u16 = 31;
pub const KEY_D: u16 = 32;
pub const KEY_F: u16 = 33;
pub const KEY_G: u16 = 34;
pub const KEY_H: u16 = 35;
pub const KEY_J: u16 = 36;
pub const KEY_K: u16 = 37;
pub const KEY_L: u16 = 38;
pub const KEY_SEMICOLON: u16 = 39;
pub const KEY_APOSTROPHE: u16 = 40;
pub const KEY_GRAVE: u16 = 41;
pub const KEY_LEFTSHIFT: u16 = 42;
pub const KEY_BACKSLASH: u16 = 43;
pub const KEY_Z: u16 = 44;
pub const KEY_X: u16 = 45;
pub const KEY_C: u16 = 46;
pub const KEY_V: u16 = 47;
pub const KEY_B: u16 = 48;
pub const KEY_N: u16 = 49;
pub const KEY_M: u16 = 50;
pub const KEY_COMMA: u16 = 51;
pub const KEY_DOT: u16 = 52;
pub const KEY_SLASH: u16 = 53;
pub const KEY_RIGHTSHIFT: u16 = 54;
pub const KEY_KPASTERISK: u16 = 55;
pub const KEY_LEFTALT: u16 = 56;
pub const KEY_SPACE: u16 = 57;
pub const KEY_CAPSLOCK: u16 = 58;
pub const KEY_F1: u16 = 59;
pub const KEY_F2: u16 = 60;
pub const KEY_F3: u16 = 61;
pub const KEY_F4: u16 = 62;
pub const KEY_F5: u16 = 63;
pub const KEY_F6: u16 = 64;
pub const KEY_F7: u16 = 65;
pub const KEY_F8: u16 = 66;
pub const KEY_F9: u16 = 67;
pub const KEY_F10: u16 = 68;
pub const KEY_NUMLOCK: u16 = 69;
pub const KEY_SCROLLLOCK: u16 = 70;
pub const KEY_KP7: u16 = 71;
pub const KEY_KP8: u16 = 72;
pub const KEY_KP9: u16 = 73;
pub const KEY_KPMINUS: u16 = 74;
pub const KEY_KP4: u16 = 75;
pub const KEY_KP5: u16 = 76;
pub const KEY_KP6: u16 = 77;
pub const KEY_KPPLUS: u16 = 78;
pub const KEY_KP1: u16 = 79;
pub const KEY_KP2: u16 = 80;
pub const KEY_KP3: u16 = 81;
pub const KEY_KP0: u16 = 82;
pub const KEY_KPDOT: u16 = 83;
pub const KEY_ZENKAKUHANKAKU: u16 = 85;
pub const KEY_102ND: u16 = 86;
pub const KEY_F11: u16 = 87;
pub const KEY_F12: u16 = 88;
pub const KEY_RO: u16 = 89;
pub const KEY_KATAKANA: u16 = 90;
pub const KEY_HIRAGANA: u16 = 91;
pub const KEY_HENKAN: u16 = 92;
pub const KEY_KATAKANAHIRAGANA: u16 = 93;
pub const KEY_MUHENKAN: u16 = 94;
pub const KEY_KPJPCOMMA: u16 = 95;
pub const KEY_KPENTER: u16 = 96;
pub const KEY_RIGHTCTRL: u16 = 97;
pub const KEY_KPSLASH: u16 = 98;
pub const KEY_SYSRQ: u16 = 99;
pub const KEY_RIGHTALT: u16 = 100;
pub const KEY_LINEFEED: u16 = 101;
pub const KEY_HOME: u16 = 102;
pub const KEY_UP: u16 = 103;
pub const KEY_PAGEUP: u16 = 104;
pub const KEY_LEFT: u16 = 105;
pub const KEY_RIGHT: u16 = 106;
pub const KEY_END: u16 = 107;
pub const KEY_DOWN: u16 = 108;
pub const KEY_PAGEDOWN: u16 = 109;
pub const KEY_INSERT: u16 = 110;
pub const KEY_DELETE: u16 = 111;
pub const KEY_MACRO: u16 = 112;
pub const KEY_MUTE: u16 = 113;
pub const KEY_VOLUMEDOWN: u16 = 114;
pub const KEY_VOLUMEUP: u16 = 115;
pub const KEY_POWER: u16 = 116;
pub const KEY_KPEQUAL: u16 = 117;
pub const KEY_KPPLUSMINUS: u16 = 118;
pub const KEY_PAUSE: u16 = 119;
pub const KEY_SCALE: u16 = 120;
pub const KEY_KPCOMMA: u16 = 121;
pub const KEY_HANGEUL: u16 = 122;
pub const KEY_HANGUEL: u16 = KEY_HANGEUL;
pub const KEY_HANJA: u16 = 123;
pub const KEY_YEN: u16 = 124;
pub const KEY_LEFTMETA: u16 = 125;
pub const KEY_RIGHTMETA: u16 = 126;
pub const KEY_COMPOSE: u16 = 127;
pub const KEY_STOP: u16 = 128;
pub const KEY_AGAIN: u16 = 129;
pub const KEY_PROPS: u16 = 130;
pub const KEY_UNDO: u16 = 131;
pub const KEY_FRONT: u16 = 132;
pub const KEY_COPY: u16 = 133;
pub const KEY_OPEN: u16 = 134;
pub const KEY_PASTE: u16 = 135;
pub const KEY_FIND: u16 = 136;
pub const KEY_CUT: u16 = 137;
pub const KEY_HELP: u16 = 138;
pub const KEY_MENU: u16 = 139;
pub const KEY_CALC: u16 = 140;
pub const KEY_SETUP: u16 = 141;
pub const KEY_SLEEP: u16 = 142;
pub const KEY_WAKEUP: u16 = 143;
pub const KEY_FILE: u16 = 144;
pub const KEY_SENDFILE: u16 = 145;
pub const KEY_DELETEFILE: u16 = 146;
pub const KEY_XFER: u16 = 147;
pub const KEY_PROG1: u16 = 148;
pub const KEY_PROG2: u16 = 149;
pub const KEY_WWW: u16 = 150;
pub const KEY_MSDOS: u16 = 151;
pub const KEY_COFFEE: u16 = 152;
pub const KEY_SCREENLOCK: u16 = KEY_COFFEE;
pub const KEY_ROTATE_DISPLAY: u16 = 153;
pub const KEY_DIRECTION: u16 = KEY_ROTATE_DISPLAY;
pub const KEY_CYCLEWINDOWS: u16 = 154;
pub const KEY_MAIL: u16 = 155;
pub const KEY_BOOKMARKS: u16 = 156;
pub const KEY_COMPUTER: u16 = 157;
pub const KEY_BACK: u16 = 158;
pub const KEY_FORWARD: u16 = 159;
pub const KEY_CLOSECD: u16 = 160;
pub const KEY_EJECTCD: u16 = 161;
pub const KEY_EJECTCLOSECD: u16 = 162;
pub const KEY_NEXTSONG: u16 = 163;
pub const KEY_PLAYPAUSE: u16 = 164;
pub const KEY_PREVIOUSSONG: u16 = 165;
pub const KEY_STOPCD: u16 = 166;
pub const KEY_RECORD: u16 = 167;
pub const KEY_REWIND: u16 = 168;
pub const KEY_PHONE: u16 = 169;
pub const KEY_ISO: u16 = 170;
pub const KEY_CONFIG: u16 = 171;
pub const KEY_HOMEPAGE: u16 = 172;
pub const KEY_REFRESH: u16 = 173;
pub const KEY_EXIT: u16 = 174;
pub const KEY_MOVE: u16 = 175;
pub const KEY_EDIT: u16 = 176;
pub const KEY_SCROLLUP: u16 = 177;
pub const KEY_SCROLLDOWN: u16 = 178;
pub const KEY_KPLEFTPAREN: u16 = 179;
pub const KEY_KPRIGHTPAREN: u16 = 180;
pub const KEY_NEW: u16 = 181;
pub const KEY_REDO: u16 = 182;
pub const KEY_F13: u16 = 183;
pub const KEY_F14: u16 = 184;
pub const KEY_F15: u16 = 185;
pub const KEY_F16: u16 = 186;
pub const KEY_F17: u16 = 187;
pub const KEY_F18: u16 = 188;
pub const KEY_F19: u16 = 189;
pub const KEY_F20: u16 = 190;
pub const KEY_F21: u16 = 191;
pub const KEY_F22: u16 = 192;
pub const KEY_F23: u16 = 193;
pub const KEY_F24: u16 = 194;
pub const KEY_PLAYCD: u16 = 200;
pub const KEY_PAUSECD: u16 = 201;
pub const KEY_PROG3: u16 = 202;
pub const KEY_PROG4: u16 = 203;
pub const KEY_ALL_APPLICATIONS: u16 = 204;
pub const KEY_DASHBOARD: u16 = KEY_ALL_APPLICATIONS;
pub const KEY_SUSPEND: u16 = 205;
pub const KEY_CLOSE: u16 = 206;
pub const KEY_PLAY: u16 = 207;
pub const KEY_FASTFORWARD: u16 = 208;
pub const KEY_BASSBOOST: u16 = 209;
pub const KEY_PRINT: u16 = 210;
pub const KEY_HP: u16 = 211;
pub const KEY_CAMERA: u16 = 212;
pub const KEY_SOUND: u16 = 213;
pub const KEY_QUESTION: u16 = 214;
pub const KEY_EMAIL: u16 = 215;
pub const KEY_CHAT: u16 = 216;
pub const KEY_SEARCH: u16 = 217;
pub const KEY_CONNECT: u16 = 218;
pub const KEY_FINANCE: u16 = 219;
pub const KEY_SPORT: u16 = 220;
pub const KEY_SHOP: u16 = 221;
pub const KEY_ALTERASE: u16 = 222;
pub const KEY_CANCEL: u16 = 223;
pub const KEY_BRIGHTNESSDOWN: u16 = 224;
pub const KEY_BRIGHTNESSUP: u16 = 225;
pub const KEY_MEDIA: u16 = 226;
pub const KEY_SWITCHVIDEOMODE: u16 = 227;
pub const KEY_KBDILLUMTOGGLE: u16 = 228;
pub const KEY_KBDILLUMDOWN: u16 = 229;
pub const KEY_KBDILLUMUP: u16 = 230;
pub const KEY_SEND: u16 = 231;
pub const KEY_REPLY: u16 = 232;
pub const KEY_FORWARDMAIL: u16 = 233;
pub const KEY_SAVE: u16 = 234;
pub const KEY_DOCUMENTS: u16 = 235;
pub const KEY_BATTERY: u16 = 236;
pub const KEY_BLUETOOTH: u16 = 237;
pub const KEY_WLAN: u16 = 238;
pub const KEY_UWB: u16 = 239;
pub const KEY_UNKNOWN: u16 = 240;
pub const KEY_VIDEO_NEXT: u16 = 241;
pub const KEY_VIDEO_PREV: u16 = 242;
pub const KEY_BRIGHTNESS_CYCLE: u16 = 243;
pub const KEY_BRIGHTNESS_AUTO: u16 = 244;
pub const KEY_BRIGHTNESS_ZERO: u16 = KEY_BRIGHTNESS_AUTO;
pub const KEY_DISPLAY_OFF: u16 = 245;
pub const KEY_WWAN: u16 = 246;
pub const KEY_WIMAX: u16 = KEY_WWAN;
pub const KEY_RFKILL: u16 = 247;
pub const KEY_MICMUTE: u16 = 248;
pub const BTN_MISC: u16 = 0x100;
pub const BTN_0: u16 = 0x100;
pub const BTN_1: u16 = 0x101;
pub const BTN_2: u16 = 0x102;
pub const BTN_3: u16 = 0x103;
pub const BTN_4: u16 = 0x104;
pub const BTN_5: u16 = 0x105;
pub const BTN_6: u16 = 0x106;
pub const BTN_7: u16 = 0x107;
pub const BTN_8: u16 = 0x108;
pub const BTN_9: u16 = 0x109;
pub const BTN_MOUSE: u16 = 0x110;
pub const BTN_LEFT: u16 = 0x110;
pub const BTN_RIGHT: u16 = 0x111;
pub const BTN_MIDDLE: u16 = 0x112;
pub const BTN_SIDE: u16 = 0x113;
pub const BTN_EXTRA: u16 = 0x114;
pub const BTN_FORWARD: u16 = 0x115;
pub const BTN_BACK: u16 = 0x116;
pub const BTN_TASK: u16 = 0x117;
pub const BTN_JOYSTICK: u16 = 0x120;
pub const BTN_TRIGGER: u16 = 0x120;
pub const BTN_THUMB: u16 = 0x121;
pub const BTN_THUMB2: u16 = 0x122;
pub const BTN_TOP: u16 = 0x123;
pub const BTN_TOP2: u16 = 0x124;
pub const BTN_PINKIE: u16 = 0x125;
pub const BTN_BASE: u16 = 0x126;
pub const BTN_BASE2: u16 = 0x127;
pub const BTN_BASE3: u16 = 0x128;
pub const BTN_BASE4: u16 = 0x129;
pub const BTN_BASE5: u16 = 0x12a;
pub const BTN_BASE6: u16 = 0x12b;
pub const BTN_DEAD: u16 = 0x12f;
pub const BTN_GAMEPAD: u16 = 0x130;
pub const BTN_SOUTH: u16 = 0x130;
pub const BTN_A: u16 = BTN_SOUTH;
pub const BTN_EAST: u16 = 0x131;
pub const BTN_B: u16 = BTN_EAST;
pub const BTN_C: u16 = 0x132;
pub const BTN_NORTH: u16 = 0x133;
pub const BTN_X: u16 = BTN_NORTH;
pub const BTN_WEST: u16 = 0x134;
pub const BTN_Y: u16 = BTN_WEST;
pub const BTN_Z: u16 = 0x135;
pub const BTN_TL: u16 = 0x136;
pub const BTN_TR: u16 = 0x137;
pub const BTN_TL2: u16 = 0x138;
pub const BTN_TR2: u16 = 0x139;
pub const BTN_SELECT: u16 = 0x13a;
pub const BTN_START: u16 = 0x13b;
pub const BTN_MODE: u16 = 0x13c;
pub const BTN_THUMBL: u16 = 0x13d;
pub const BTN_THUMBR: u16 = 0x13e;
pub const BTN_DIGI: u16 = 0x140;
pub const BTN_TOOL_PEN: u16 = 0x140;
pub const BTN_TOOL_RUBBER: u16 = 0x141;
pub const BTN_TOOL_BRUSH: u16 = 0x142;
pub const BTN_TOOL_PENCIL: u16 = 0x143;
pub const BTN_TOOL_AIRBRUSH: u16 = 0x144;
pub const BTN_TOOL_FINGER: u16 = 0x145;
pub const BTN_TOOL_MOUSE: u16 = 0x146;
pub const BTN_TOOL_LENS: u16 = 0x147;
pub const BTN_TOOL_QUINTTAP: u16 = 0x148;
pub const BTN_STYLUS3: u16 = 0x149;
pub const BTN_TOUCH: u16 = 0x14a;
pub const BTN_STYLUS: u16 = 0x14b;
pub const BTN_STYLUS2: u16 = 0x14c;
pub const BTN_TOOL_DOUBLETAP: u16 = 0x14d;
pub const BTN_TOOL_TRIPLETAP: u16 = 0x14e;
pub const BTN_TOOL_QUADTAP: u16 = 0x14f;
pub const BTN_WHEEL: u16 = 0x150;
pub const BTN_GEAR_DOWN: u16 = 0x150;
pub const BTN_GEAR_UP: u16 = 0x151;
pub const KEY_OK: u16 = 0x160;
pub const KEY_SELECT: u16 = 0x161;
pub const KEY_GOTO: u16 = 0x162;
pub const KEY_CLEAR: u16 = 0x163;
pub const KEY_POWER2: u16 = 0x164;
pub const KEY_OPTION: u16 = 0x165;
pub const KEY_INFO: u16 = 0x166;
pub const KEY_TIME: u16 = 0x167;
pub const KEY_VENDOR: u16 = 0x168;
pub const KEY_ARCHIVE: u16 = 0x169;
pub const KEY_PROGRAM: u16 = 0x16a;
pub const KEY_CHANNEL: u16 = 0x16b;
pub const KEY_FAVORITES: u16 = 0x16c;
pub const KEY_EPG: u16 = 0x16d;
pub const KEY_PVR: u16 = 0x16e;
pub const KEY_MHP: u16 = 0x16f;
pub const KEY_LANGUAGE: u16 = 0x170;
pub const KEY_TITLE: u16 = 0x171;
pub const KEY_SUBTITLE: u16 = 0x172;
pub const KEY_ANGLE: u16 = 0x173;
pub const KEY_FULL_SCREEN: u16 = 0x174;
pub const KEY_ZOOM: u16 = KEY_FULL_SCREEN;
pub const KEY_MODE: u16 = 0x175;
pub const KEY_KEYBOARD: u16 = 0x176;
pub const KEY_ASPECT_RATIO: u16 = 0x177;
pub const KEY_SCREEN: u16 = KEY_ASPECT_RATIO;
pub const KEY_PC: u16 = 0x178;
pub const KEY_TV: u16 = 0x179;
pub const KEY_TV2: u16 = 0x17a;
pub const KEY_VCR: u16 = 0x17b;
pub const KEY_VCR2: u16 = 0x17c;
pub const KEY_SAT: u16 = 0x17d;
pub const KEY_SAT2: u16 = 0x17e;
pub const KEY_CD: u16 = 0x17f;
pub const KEY_TAPE: u16 = 0x180;
pub const KEY_RADIO: u16 = 0x181;
pub const KEY_TUNER: u16 = 0x182;
pub const KEY_PLAYER: u16 = 0x183;
pub const KEY_TEXT: u16 = 0x184;
pub const KEY_DVD: u16 = 0x185;
pub const KEY_AUX: u16 = 0x186;
pub const KEY_MP3: u16 = 0x187;
pub const KEY_AUDIO: u16 = 0x188;
pub const KEY_VIDEO: u16 = 0x189;
pub const KEY_DIRECTORY: u16 = 0x18a;
pub const KEY_LIST: u16 = 0x18b;
pub const KEY_MEMO: u16 = 0x18c;
pub const KEY_CALENDAR: u16 = 0x18d;
pub const KEY_RED: u16 = 0x18e;
pub const KEY_GREEN: u16 = 0x18f;
pub const KEY_YELLOW: u16 = 0x190;
pub const KEY_BLUE: u16 = 0x191;
pub const KEY_CHANNELUP: u16 = 0x192;
pub const KEY_CHANNELDOWN: u16 = 0x193;
pub const KEY_FIRST: u16 = 0x194;
pub const KEY_LAST: u16 = 0x195;
pub const KEY_AB: u16 = 0x196;
pub const KEY_NEXT: u16 = 0x197;
pub const KEY_RESTART: u16 = 0x198;
pub const KEY_SLOW: u16 = 0x199;
pub const KEY_SHUFFLE: u16 = 0x19a;
pub const KEY_BREAK: u16 = 0x19b;
pub const KEY_PREVIOUS: u16 = 0x19c;
pub const KEY_DIGITS: u16 = 0x19d;
pub const KEY_TEEN: u16 = 0x19e;
pub const KEY_TWEN: u16 = 0x19f;
pub const KEY_VIDEOPHONE: u16 = 0x1a0;
pub const KEY_GAMES: u16 = 0x1a1;
pub const KEY_ZOOMIN: u16 = 0x1a2;
pub const KEY_ZOOMOUT: u16 = 0x1a3;
pub const KEY_ZOOMRESET: u16 = 0x1a4;
pub const KEY_WORDPROCESSOR: u16 = 0x1a5;
pub const KEY_EDITOR: u16 = 0x1a6;
pub const KEY_SPREADSHEET: u16 = 0x1a7;
pub const KEY_GRAPHICSEDITOR: u16 = 0x1a8;
pub const KEY_PRESENTATION: u16 = 0x1a9;
pub const KEY_DATABASE: u16 = 0x1aa;
pub const KEY_NEWS: u16 = 0x1ab;
pub const KEY_VOICEMAIL: u16 = 0x1ac;
pub const KEY_ADDRESSBOOK: u16 = 0x1ad;
pub const KEY_MESSENGER: u16 = 0x1ae;
pub const KEY_DISPLAYTOGGLE: u16 = 0x1af;
pub const KEY_BRIGHTNESS_TOGGLE: u16 = KEY_DISPLAYTOGGLE;
pub const KEY_SPELLCHECK: u16 = 0x1b0;
pub const KEY_LOGOFF: u16 = 0x1b1;
pub const KEY_DOLLAR: u16 = 0x1b2;
pub const KEY_EURO: u16 = 0x1b3;
pub const KEY_FRAMEBACK: u16 = 0x1b4;
pub const KEY_FRAMEFORWARD: u16 = 0x1b5;
pub const KEY_CONTEXT_MENU: u16 = 0x1b6;
pub const KEY_MEDIA_REPEAT: u16 = 0x1b7;
pub const KEY_10CHANNELSUP: u16 = 0x1b8;
pub const KEY_10CHANNELSDOWN: u16 = 0x1b9;
pub const KEY_IMAGES: u16 = 0x1ba;
pub const KEY_NOTIFICATION_CENTER: u16 = 0x1bc;
pub const KEY_PICKUP_PHONE: u16 = 0x1bd;
pub const KEY_HANGUP_PHONE: u16 = 0x1be;
pub const KEY_LINK_PHONE: u16 = 0x1bf;
pub const KEY_DEL_EOL: u16 = 0x1c0;
pub const KEY_DEL_EOS: u16 = 0x1c1;
pub const KEY_INS_LINE: u16 = 0x1c2;
pub const KEY_DEL_LINE: u16 = 0x1c3;
pub const KEY_FN: u16 = 0x1d0;
pub const KEY_FN_ESC: u16 = 0x1d1;
pub const KEY_FN_F1: u16 = 0x1d2;
pub const KEY_FN_F2: u16 = 0x1d3;
pub const KEY_FN_F3: u16 = 0x1d4;
pub const KEY_FN_F4: u16 = 0x1d5;
pub const KEY_FN_F5: u16 = 0x1d6;
pub const KEY_FN_F6: u16 = 0x1d7;
pub const KEY_FN_F7: u16 = 0x1d8;
pub const KEY_FN_F8: u16 = 0x1d9;
pub const KEY_FN_F9: u16 = 0x1da;
pub const KEY_FN_F10: u16 = 0x1db;
pub const KEY_FN_F11: u16 = 0x1dc;
pub const KEY_FN_F12: u16 = 0x1dd;
pub const KEY_FN_1: u16 = 0x1de;
pub const KEY_FN_2: u16 = 0x1df;
pub const KEY_FN_D: u16 = 0x1e0;
pub const KEY_FN_E: u16 = 0x1e1;
pub const KEY_FN_F: u16 = 0x1e2;
pub const KEY_FN_S: u16 = 0x1e3;
pub const KEY_FN_B: u16 = 0x1e4;
pub const KEY_FN_RIGHT_SHIFT: u16 = 0x1e5;
pub const KEY_BRL_DOT1: u16 = 0x1f1;
pub const KEY_BRL_DOT2: u16 = 0x1f2;
pub const KEY_BRL_DOT3: u16 = 0x1f3;
pub const KEY_BRL_DOT4: u16 = 0x1f4;
pub const KEY_BRL_DOT5: u16 = 0x1f5;
pub const KEY_BRL_DOT6: u16 = 0x1f6;
pub const KEY_BRL_DOT7: u16 = 0x1f7;
pub const KEY_BRL_DOT8: u16 = 0x1f8;
pub const KEY_BRL_DOT9: u16 = 0x1f9;
pub const KEY_BRL_DOT10: u16 = 0x1fa;
pub const KEY_NUMERIC_0: u16 = 0x200;
pub const KEY_NUMERIC_1: u16 = 0x201;
pub const KEY_NUMERIC_2: u16 = 0x202;
pub const KEY_NUMERIC_3: u16 = 0x203;
pub const KEY_NUMERIC_4: u16 = 0x204;
pub const KEY_NUMERIC_5: u16 = 0x205;
pub const KEY_NUMERIC_6: u16 = 0x206;
pub const KEY_NUMERIC_7: u16 = 0x207;
pub const KEY_NUMERIC_8: u16 = 0x208;
pub const KEY_NUMERIC_9: u16 = 0x209;
pub const KEY_NUMERIC_STAR: u16 = 0x20a;
pub const KEY_NUMERIC_POUND: u16 = 0x20b;
pub const KEY_NUMERIC_A: u16 = 0x20c;
pub const KEY_NUMERIC_B: u16 = 0x20d;
pub const KEY_NUMERIC_C: u16 = 0x20e;
pub const KEY_NUMERIC_D: u16 = 0x20f;
pub const KEY_CAMERA_FOCUS: u16 = 0x210;
pub const KEY_WPS_BUTTON: u16 = 0x211;
pub const KEY_TOUCHPAD_TOGGLE: u16 = 0x212;
pub const KEY_TOUCHPAD_ON: u16 = 0x213;
pub const KEY_TOUCHPAD_OFF: u16 = 0x214;
pub const KEY_CAMERA_ZOOMIN: u16 = 0x215;
pub const KEY_CAMERA_ZOOMOUT: u16 = 0x216;
pub const KEY_CAMERA_UP: u16 = 0x217;
pub const KEY_CAMERA_DOWN: u16 = 0x218;
pub const KEY_CAMERA_LEFT: u16 = 0x219;
pub const KEY_CAMERA_RIGHT: u16 = 0x21a;
pub const KEY_ATTENDANT_ON: u16 = 0x21b;
pub const KEY_ATTENDANT_OFF: u16 = 0x21c;
pub const KEY_ATTENDANT_TOGGLE: u16 = 0x21d;
pub const KEY_LIGHTS_TOGGLE: u16 = 0x21e;
pub const BTN_DPAD_UP: u16 = 0x220;
pub const BTN_DPAD_DOWN: u16 = 0x221;
pub const BTN_DPAD_LEFT: u16 = 0x222;
pub const BTN_DPAD_RIGHT: u16 = 0x223;
pub const BTN_GRIPL: u16 = 0x224;
pub const BTN_GRIPR: u16 = 0x225;
pub const BTN_GRIPL2: u16 = 0x226;
pub const BTN_GRIPR2: u16 = 0x227;
pub const KEY_ALS_TOGGLE: u16 = 0x230;
pub const KEY_ROTATE_LOCK_TOGGLE: u16 = 0x231;
pub const KEY_REFRESH_RATE_TOGGLE: u16 = 0x232;
pub const KEY_BUTTONCONFIG: u16 = 0x240;
pub const KEY_TASKMANAGER: u16 = 0x241;
pub const KEY_JOURNAL: u16 = 0x242;
pub const KEY_CONTROLPANEL: u16 = 0x243;
pub const KEY_APPSELECT: u16 = 0x244;
pub const KEY_SCREENSAVER: u16 = 0x245;
pub const KEY_VOICECOMMAND: u16 = 0x246;
pub const KEY_ASSISTANT: u16 = 0x247;
pub const KEY_KBD_LAYOUT_NEXT: u16 = 0x248;
pub const KEY_EMOJI_PICKER: u16 = 0x249;
pub const KEY_DICTATE: u16 = 0x24a;
pub const KEY_CAMERA_ACCESS_ENABLE: u16 = 0x24b;
pub const KEY_CAMERA_ACCESS_DISABLE: u16 = 0x24c;
pub const KEY_CAMERA_ACCESS_TOGGLE: u16 = 0x24d;
pub const KEY_ACCESSIBILITY: u16 = 0x24e;
pub const KEY_DO_NOT_DISTURB: u16 = 0x24f;
pub const KEY_BRIGHTNESS_MIN: u16 = 0x250;
pub const KEY_BRIGHTNESS_MAX: u16 = 0x251;
pub const KEY_EPRIVACY_SCREEN_ON: u16 = 0x252;
pub const KEY_EPRIVACY_SCREEN_OFF: u16 = 0x253;
pub const KEY_ACTION_ON_SELECTION: u16 = 0x254;
pub const KEY_CONTEXTUAL_INSERT: u16 = 0x255;
pub const KEY_CONTEXTUAL_QUERY: u16 = 0x256;
pub const KEY_KBDINPUTASSIST_PREV: u16 = 0x260;
pub const KEY_KBDINPUTASSIST_NEXT: u16 = 0x261;
pub const KEY_KBDINPUTASSIST_PREVGROUP: u16 = 0x262;
pub const KEY_KBDINPUTASSIST_NEXTGROUP: u16 = 0x263;
pub const KEY_KBDINPUTASSIST_ACCEPT: u16 = 0x264;
pub const KEY_KBDINPUTASSIST_CANCEL: u16 = 0x265;
pub const KEY_RIGHT_UP: u16 = 0x266;
pub const KEY_RIGHT_DOWN: u16 = 0x267;
pub const KEY_LEFT_UP: u16 = 0x268;
pub const KEY_LEFT_DOWN: u16 = 0x269;
pub const KEY_ROOT_MENU: u16 = 0x26a;
pub const KEY_MEDIA_TOP_MENU: u16 = 0x26b;
pub const KEY_NUMERIC_11: u16 = 0x26c;
pub const KEY_NUMERIC_12: u16 = 0x26d;
pub const KEY_AUDIO_DESC: u16 = 0x26e;
pub const KEY_3D_MODE: u16 = 0x26f;
pub const KEY_NEXT_FAVORITE: u16 = 0x270;
pub const KEY_STOP_RECORD: u16 = 0x271;
pub const KEY_PAUSE_RECORD: u16 = 0x272;
pub const KEY_VOD: u16 = 0x273;
pub const KEY_UNMUTE: u16 = 0x274;
pub const KEY_FASTREVERSE: u16 = 0x275;
pub const KEY_SLOWREVERSE: u16 = 0x276;
pub const KEY_DATA: u16 = 0x277;
pub const KEY_ONSCREEN_KEYBOARD: u16 = 0x278;
pub const KEY_PRIVACY_SCREEN_TOGGLE: u16 = 0x279;
pub const KEY_SELECTIVE_SCREENSHOT: u16 = 0x27a;
pub const KEY_NEXT_ELEMENT: u16 = 0x27b;
pub const KEY_PREVIOUS_ELEMENT: u16 = 0x27c;
pub const KEY_AUTOPILOT_ENGAGE_TOGGLE: u16 = 0x27d;
pub const KEY_MARK_WAYPOINT: u16 = 0x27e;
pub const KEY_SOS: u16 = 0x27f;
pub const KEY_NAV_CHART: u16 = 0x280;
pub const KEY_FISHING_CHART: u16 = 0x281;
pub const KEY_SINGLE_RANGE_RADAR: u16 = 0x282;
pub const KEY_DUAL_RANGE_RADAR: u16 = 0x283;
pub const KEY_RADAR_OVERLAY: u16 = 0x284;
pub const KEY_TRADITIONAL_SONAR: u16 = 0x285;
pub const KEY_CLEARVU_SONAR: u16 = 0x286;
pub const KEY_SIDEVU_SONAR: u16 = 0x287;
pub const KEY_NAV_INFO: u16 = 0x288;
pub const KEY_BRIGHTNESS_MENU: u16 = 0x289;
pub const KEY_MACRO1: u16 = 0x290;
pub const KEY_MACRO2: u16 = 0x291;
pub const KEY_MACRO3: u16 = 0x292;
pub const KEY_MACRO4: u16 = 0x293;
pub const KEY_MACRO5: u16 = 0x294;
pub const KEY_MACRO6: u16 = 0x295;
pub const KEY_MACRO7: u16 = 0x296;
pub const KEY_MACRO8: u16 = 0x297;
pub const KEY_MACRO9: u16 = 0x298;
pub const KEY_MACRO10: u16 = 0x299;
pub const KEY_MACRO11: u16 = 0x29a;
pub const KEY_MACRO12: u16 = 0x29b;
pub const KEY_MACRO13: u16 = 0x29c;
pub const KEY_MACRO14: u16 = 0x29d;
pub const KEY_MACRO15: u16 = 0x29e;
pub const KEY_MACRO16: u16 = 0x29f;
pub const KEY_MACRO17: u16 = 0x2a0;
pub const KEY_MACRO18: u16 = 0x2a1;
pub const KEY_MACRO19: u16 = 0x2a2;
pub const KEY_MACRO20: u16 = 0x2a3;
pub const KEY_MACRO21: u16 = 0x2a4;
pub const KEY_MACRO22: u16 = 0x2a5;
pub const KEY_MACRO23: u16 = 0x2a6;
pub const KEY_MACRO24: u16 = 0x2a7;
pub const KEY_MACRO25: u16 = 0x2a8;
pub const KEY_MACRO26: u16 = 0x2a9;
pub const KEY_MACRO27: u16 = 0x2aa;
pub const KEY_MACRO28: u16 = 0x2ab;
pub const KEY_MACRO29: u16 = 0x2ac;
pub const KEY_MACRO30: u16 = 0x2ad;
pub const KEY_MACRO_RECORD_START: u16 = 0x2b0;
pub const KEY_MACRO_RECORD_STOP: u16 = 0x2b1;
pub const KEY_MACRO_PRESET_CYCLE: u16 = 0x2b2;
pub const KEY_MACRO_PRESET1: u16 = 0x2b3;
pub const KEY_MACRO_PRESET2: u16 = 0x2b4;
pub const KEY_MACRO_PRESET3: u16 = 0x2b5;
pub const KEY_KBD_LCD_MENU1: u16 = 0x2b8;
pub const KEY_KBD_LCD_MENU2: u16 = 0x2b9;
pub const KEY_KBD_LCD_MENU3: u16 = 0x2ba;
pub const KEY_KBD_LCD_MENU4: u16 = 0x2bb;
pub const KEY_KBD_LCD_MENU5: u16 = 0x2bc;
pub const KEY_PERFORMANCE: u16 = 0x2bd;
pub const BTN_TRIGGER_HAPPY: u16 = 0x2c0;
pub const BTN_TRIGGER_HAPPY1: u16 = 0x2c0;
pub const BTN_TRIGGER_HAPPY2: u16 = 0x2c1;
pub const BTN_TRIGGER_HAPPY3: u16 = 0x2c2;
pub const BTN_TRIGGER_HAPPY4: u16 = 0x2c3;
pub const BTN_TRIGGER_HAPPY5: u16 = 0x2c4;
pub const BTN_TRIGGER_HAPPY6: u16 = 0x2c5;
pub const BTN_TRIGGER_HAPPY7: u16 = 0x2c6;
pub const BTN_TRIGGER_HAPPY8: u16 = 0x2c7;
pub const BTN_TRIGGER_HAPPY9: u16 = 0x2c8;
pub const BTN_TRIGGER_HAPPY10: u16 = 0x2c9;
pub const BTN_TRIGGER_HAPPY11: u16 = 0x2ca;
pub const BTN_TRIGGER_HAPPY12: u16 = 0x2cb;
pub const BTN_TRIGGER_HAPPY13: u16 = 0x2cc;
pub const BTN_TRIGGER_HAPPY14: u16 = 0x2cd;
pub const BTN_TRIGGER_HAPPY15: u16 = 0x2ce;
pub const BTN_TRIGGER_HAPPY16: u16 = 0x2cf;
pub const BTN_TRIGGER_HAPPY17: u16 = 0x2d0;
pub const BTN_TRIGGER_HAPPY18: u16 = 0x2d1;
pub const BTN_TRIGGER_HAPPY19: u16 = 0x2d2;
pub const BTN_TRIGGER_HAPPY20: u16 = 0x2d3;
pub const BTN_TRIGGER_HAPPY21: u16 = 0x2d4;
pub const BTN_TRIGGER_HAPPY22: u16 = 0x2d5;
pub const BTN_TRIGGER_HAPPY23: u16 = 0x2d6;
pub const BTN_TRIGGER_HAPPY24: u16 = 0x2d7;
pub const BTN_TRIGGER_HAPPY25: u16 = 0x2d8;
pub const BTN_TRIGGER_HAPPY26: u16 = 0x2d9;
pub const BTN_TRIGGER_HAPPY27: u16 = 0x2da;
pub const BTN_TRIGGER_HAPPY28: u16 = 0x2db;
pub const BTN_TRIGGER_HAPPY29: u16 = 0x2dc;
pub const BTN_TRIGGER_HAPPY30: u16 = 0x2dd;
pub const BTN_TRIGGER_HAPPY31: u16 = 0x2de;
pub const BTN_TRIGGER_HAPPY32: u16 = 0x2df;
pub const BTN_TRIGGER_HAPPY33: u16 = 0x2e0;
pub const BTN_TRIGGER_HAPPY34: u16 = 0x2e1;
pub const BTN_TRIGGER_HAPPY35: u16 = 0x2e2;
pub const BTN_TRIGGER_HAPPY36: u16 = 0x2e3;
pub const BTN_TRIGGER_HAPPY37: u16 = 0x2e4;
pub const BTN_TRIGGER_HAPPY38: u16 = 0x2e5;
pub const BTN_TRIGGER_HAPPY39: u16 = 0x2e6;
pub const BTN_TRIGGER_HAPPY40: u16 = 0x2e7;
pub const KEY_MIN_INTERESTING: u16 = KEY_MUTE;
pub const KEY_MAX: u16 = 0x2ff;
pub const KEY_CNT: u16 = (KEY_MAX + 1);
pub const REL_X: u16 = 0x00;
pub const REL_Y: u16 = 0x01;
pub const REL_Z: u16 = 0x02;
pub const REL_RX: u16 = 0x03;
pub const REL_RY: u16 = 0x04;
pub const REL_RZ: u16 = 0x05;
pub const REL_HWHEEL: u16 = 0x06;
pub const REL_DIAL: u16 = 0x07;
pub const REL_WHEEL: u16 = 0x08;
pub const REL_MISC: u16 = 0x09;
pub const REL_RESERVED: u16 = 0x0a;
pub const REL_WHEEL_HI_RES: u16 = 0x0b;
pub const REL_HWHEEL_HI_RES: u16 = 0x0c;
pub const REL_MAX: u16 = 0x0f;
pub const REL_CNT: u16 = (REL_MAX + 1);
pub const ABS_X: u16 = 0x00;
pub const ABS_Y: u16 = 0x01;
pub const ABS_Z: u16 = 0x02;
pub const ABS_RX: u16 = 0x03;
pub const ABS_RY: u16 = 0x04;
pub const ABS_RZ: u16 = 0x05;
pub const ABS_THROTTLE: u16 = 0x06;
pub const ABS_RUDDER: u16 = 0x07;
pub const ABS_WHEEL: u16 = 0x08;
pub const ABS_GAS: u16 = 0x09;
pub const ABS_BRAKE: u16 = 0x0a;
pub const ABS_HAT0X: u16 = 0x10;
pub const ABS_HAT0Y: u16 = 0x11;
pub const ABS_HAT1X: u16 = 0x12;
pub const ABS_HAT1Y: u16 = 0x13;
pub const ABS_HAT2X: u16 = 0x14;
pub const ABS_HAT2Y: u16 = 0x15;
pub const ABS_HAT3X: u16 = 0x16;
pub const ABS_HAT3Y: u16 = 0x17;
pub const ABS_PRESSURE: u16 = 0x18;
pub const ABS_DISTANCE: u16 = 0x19;
pub const ABS_TILT_X: u16 = 0x1a;
pub const ABS_TILT_Y: u16 = 0x1b;
pub const ABS_TOOL_WIDTH: u16 = 0x1c;
pub const ABS_VOLUME: u16 = 0x20;
pub const ABS_PROFILE: u16 = 0x21;
pub const ABS_SND_PROFILE: u16 = 0x22;
pub const ABS_MISC: u16 = 0x28;
pub const ABS_RESERVED: u16 = 0x2e;
pub const ABS_MT_SLOT: u16 = 0x2f;
pub const ABS_MT_TOUCH_MAJOR: u16 = 0x30;
pub const ABS_MT_TOUCH_MINOR: u16 = 0x31;
pub const ABS_MT_WIDTH_MAJOR: u16 = 0x32;
pub const ABS_MT_WIDTH_MINOR: u16 = 0x33;
pub const ABS_MT_ORIENTATION: u16 = 0x34;
pub const ABS_MT_POSITION_X: u16 = 0x35;
pub const ABS_MT_POSITION_Y: u16 = 0x36;
pub const ABS_MT_TOOL_TYPE: u16 = 0x37;
pub const ABS_MT_BLOB_ID: u16 = 0x38;
pub const ABS_MT_TRACKING_ID: u16 = 0x39;
pub const ABS_MT_PRESSURE: u16 = 0x3a;
pub const ABS_MT_DISTANCE: u16 = 0x3b;
pub const ABS_MT_TOOL_X: u16 = 0x3c;
pub const ABS_MT_TOOL_Y: u16 = 0x3d;
pub const ABS_MAX: u16 = 0x3f;
pub const ABS_CNT: u16 = (ABS_MAX + 1);
pub const SW_LID: u16 = 0x00;
pub const SW_TABLET_MODE: u16 = 0x01;
pub const SW_HEADPHONE_INSERT: u16 = 0x02;
pub const SW_RFKILL_ALL: u16 = 0x03;
pub const SW_RADIO: u16 = SW_RFKILL_ALL;
pub const SW_MICROPHONE_INSERT: u16 = 0x04;
pub const SW_DOCK: u16 = 0x05;
pub const SW_LINEOUT_INSERT: u16 = 0x06;
pub const SW_JACK_PHYSICAL_INSERT: u16 = 0x07;
pub const SW_VIDEOOUT_INSERT: u16 = 0x08;
pub const SW_CAMERA_LENS_COVER: u16 = 0x09;
pub const SW_KEYPAD_SLIDE: u16 = 0x0a;
pub const SW_FRONT_PROXIMITY: u16 = 0x0b;
pub const SW_ROTATE_LOCK: u16 = 0x0c;
pub const SW_LINEIN_INSERT: u16 = 0x0d;
pub const SW_MUTE_DEVICE: u16 = 0x0e;
pub const SW_PEN_INSERTED: u16 = 0x0f;
pub const SW_MACHINE_COVER: u16 = 0x10;
pub const SW_USB_INSERT: u16 = 0x11;
pub const SW_MAX: u16 = 0x11;
pub const SW_CNT: u16 = (SW_MAX + 1);
pub const MSC_SERIAL: u16 = 0x00;
pub const MSC_PULSELED: u16 = 0x01;
pub const MSC_GESTURE: u16 = 0x02;
pub const MSC_RAW: u16 = 0x03;
pub const MSC_SCAN: u16 = 0x04;
pub const MSC_TIMESTAMP: u16 = 0x05;
pub const MSC_MAX: u16 = 0x07;
pub const MSC_CNT: u16 = (MSC_MAX + 1);
pub const LED_NUML: u16 = 0x00;
pub const LED_CAPSL: u16 = 0x01;
pub const LED_SCROLLL: u16 = 0x02;
pub const LED_COMPOSE: u16 = 0x03;
pub const LED_KANA: u16 = 0x04;
pub const LED_SLEEP: u16 = 0x05;
pub const LED_SUSPEND: u16 = 0x06;
pub const LED_MUTE: u16 = 0x07;
pub const LED_MISC: u16 = 0x08;
pub const LED_MAIL: u16 = 0x09;
pub const LED_CHARGING: u16 = 0x0a;
pub const LED_MAX: u16 = 0x0f;
pub const LED_CNT: u16 = (LED_MAX + 1);
pub const REP_DELAY: u16 = 0x00;
pub const REP_PERIOD: u16 = 0x01;
pub const REP_MAX: u16 = 0x01;
pub const REP_CNT: u16 = (REP_MAX + 1);
pub const SND_CLICK: u16 = 0x00;
pub const SND_BELL: u16 = 0x01;
pub const SND_TONE: u16 = 0x02;
pub const SND_MAX: u16 = 0x07;
pub const SND_CNT: u16 = (SND_MAX + 1);
pub const SND_PROFILE_SILENT: u16 = 0x00;
pub const SND_PROFILE_VIBRATE: u16 = 0x01;
pub const SND_PROFILE_RING: u16 = 0x02;

const KeycodeMap: std.static_string_map.StaticStringMap(u16) = .initComptime(.{
    .{ "INPUT_PROP_POINTER", INPUT_PROP_POINTER },
    .{ "INPUT_PROP_DIRECT", INPUT_PROP_DIRECT },
    .{ "INPUT_PROP_BUTTONPAD", INPUT_PROP_BUTTONPAD },
    .{ "INPUT_PROP_SEMI_MT", INPUT_PROP_SEMI_MT },
    .{ "INPUT_PROP_TOPBUTTONPAD", INPUT_PROP_TOPBUTTONPAD },
    .{ "INPUT_PROP_POINTING_STICK", INPUT_PROP_POINTING_STICK },
    .{ "INPUT_PROP_ACCELEROMETER", INPUT_PROP_ACCELEROMETER },
    .{ "INPUT_PROP_PRESSUREPAD", INPUT_PROP_PRESSUREPAD },
    .{ "INPUT_PROP_MAX", INPUT_PROP_MAX },
    .{ "INPUT_PROP_CNT", INPUT_PROP_CNT },
    .{ "EV_SYN", EV_SYN },
    .{ "EV_KEY", EV_KEY },
    .{ "EV_REL", EV_REL },
    .{ "EV_ABS", EV_ABS },
    .{ "EV_MSC", EV_MSC },
    .{ "EV_SW", EV_SW },
    .{ "EV_LED", EV_LED },
    .{ "EV_SND", EV_SND },
    .{ "EV_REP", EV_REP },
    .{ "EV_FF", EV_FF },
    .{ "EV_PWR", EV_PWR },
    .{ "EV_FF_STATUS", EV_FF_STATUS },
    .{ "EV_MAX", EV_MAX },
    .{ "EV_CNT", EV_CNT },
    .{ "SYN_REPORT", SYN_REPORT },
    .{ "SYN_CONFIG", SYN_CONFIG },
    .{ "SYN_MT_REPORT", SYN_MT_REPORT },
    .{ "SYN_DROPPED", SYN_DROPPED },
    .{ "SYN_MAX", SYN_MAX },
    .{ "SYN_CNT", SYN_CNT },
    .{ "KEY_RESERVED", KEY_RESERVED },
    .{ "KEY_ESC", KEY_ESC },
    .{ "KEY_1", KEY_1 },
    .{ "KEY_2", KEY_2 },
    .{ "KEY_3", KEY_3 },
    .{ "KEY_4", KEY_4 },
    .{ "KEY_5", KEY_5 },
    .{ "KEY_6", KEY_6 },
    .{ "KEY_7", KEY_7 },
    .{ "KEY_8", KEY_8 },
    .{ "KEY_9", KEY_9 },
    .{ "KEY_0", KEY_0 },
    .{ "KEY_MINUS", KEY_MINUS },
    .{ "KEY_EQUAL", KEY_EQUAL },
    .{ "KEY_BACKSPACE", KEY_BACKSPACE },
    .{ "KEY_TAB", KEY_TAB },
    .{ "KEY_Q", KEY_Q },
    .{ "KEY_W", KEY_W },
    .{ "KEY_E", KEY_E },
    .{ "KEY_R", KEY_R },
    .{ "KEY_T", KEY_T },
    .{ "KEY_Y", KEY_Y },
    .{ "KEY_U", KEY_U },
    .{ "KEY_I", KEY_I },
    .{ "KEY_O", KEY_O },
    .{ "KEY_P", KEY_P },
    .{ "KEY_LEFTBRACE", KEY_LEFTBRACE },
    .{ "KEY_RIGHTBRACE", KEY_RIGHTBRACE },
    .{ "KEY_ENTER", KEY_ENTER },
    .{ "KEY_LEFTCTRL", KEY_LEFTCTRL },
    .{ "KEY_A", KEY_A },
    .{ "KEY_S", KEY_S },
    .{ "KEY_D", KEY_D },
    .{ "KEY_F", KEY_F },
    .{ "KEY_G", KEY_G },
    .{ "KEY_H", KEY_H },
    .{ "KEY_J", KEY_J },
    .{ "KEY_K", KEY_K },
    .{ "KEY_L", KEY_L },
    .{ "KEY_SEMICOLON", KEY_SEMICOLON },
    .{ "KEY_APOSTROPHE", KEY_APOSTROPHE },
    .{ "KEY_GRAVE", KEY_GRAVE },
    .{ "KEY_LEFTSHIFT", KEY_LEFTSHIFT },
    .{ "KEY_BACKSLASH", KEY_BACKSLASH },
    .{ "KEY_Z", KEY_Z },
    .{ "KEY_X", KEY_X },
    .{ "KEY_C", KEY_C },
    .{ "KEY_V", KEY_V },
    .{ "KEY_B", KEY_B },
    .{ "KEY_N", KEY_N },
    .{ "KEY_M", KEY_M },
    .{ "KEY_COMMA", KEY_COMMA },
    .{ "KEY_DOT", KEY_DOT },
    .{ "KEY_SLASH", KEY_SLASH },
    .{ "KEY_RIGHTSHIFT", KEY_RIGHTSHIFT },
    .{ "KEY_KPASTERISK", KEY_KPASTERISK },
    .{ "KEY_LEFTALT", KEY_LEFTALT },
    .{ "KEY_SPACE", KEY_SPACE },
    .{ "KEY_CAPSLOCK", KEY_CAPSLOCK },
    .{ "KEY_F1", KEY_F1 },
    .{ "KEY_F2", KEY_F2 },
    .{ "KEY_F3", KEY_F3 },
    .{ "KEY_F4", KEY_F4 },
    .{ "KEY_F5", KEY_F5 },
    .{ "KEY_F6", KEY_F6 },
    .{ "KEY_F7", KEY_F7 },
    .{ "KEY_F8", KEY_F8 },
    .{ "KEY_F9", KEY_F9 },
    .{ "KEY_F10", KEY_F10 },
    .{ "KEY_NUMLOCK", KEY_NUMLOCK },
    .{ "KEY_SCROLLLOCK", KEY_SCROLLLOCK },
    .{ "KEY_KP7", KEY_KP7 },
    .{ "KEY_KP8", KEY_KP8 },
    .{ "KEY_KP9", KEY_KP9 },
    .{ "KEY_KPMINUS", KEY_KPMINUS },
    .{ "KEY_KP4", KEY_KP4 },
    .{ "KEY_KP5", KEY_KP5 },
    .{ "KEY_KP6", KEY_KP6 },
    .{ "KEY_KPPLUS", KEY_KPPLUS },
    .{ "KEY_KP1", KEY_KP1 },
    .{ "KEY_KP2", KEY_KP2 },
    .{ "KEY_KP3", KEY_KP3 },
    .{ "KEY_KP0", KEY_KP0 },
    .{ "KEY_KPDOT", KEY_KPDOT },
    .{ "KEY_ZENKAKUHANKAKU", KEY_ZENKAKUHANKAKU },
    .{ "KEY_102ND", KEY_102ND },
    .{ "KEY_F11", KEY_F11 },
    .{ "KEY_F12", KEY_F12 },
    .{ "KEY_RO", KEY_RO },
    .{ "KEY_KATAKANA", KEY_KATAKANA },
    .{ "KEY_HIRAGANA", KEY_HIRAGANA },
    .{ "KEY_HENKAN", KEY_HENKAN },
    .{ "KEY_KATAKANAHIRAGANA", KEY_KATAKANAHIRAGANA },
    .{ "KEY_MUHENKAN", KEY_MUHENKAN },
    .{ "KEY_KPJPCOMMA", KEY_KPJPCOMMA },
    .{ "KEY_KPENTER", KEY_KPENTER },
    .{ "KEY_RIGHTCTRL", KEY_RIGHTCTRL },
    .{ "KEY_KPSLASH", KEY_KPSLASH },
    .{ "KEY_SYSRQ", KEY_SYSRQ },
    .{ "KEY_RIGHTALT", KEY_RIGHTALT },
    .{ "KEY_LINEFEED", KEY_LINEFEED },
    .{ "KEY_HOME", KEY_HOME },
    .{ "KEY_UP", KEY_UP },
    .{ "KEY_PAGEUP", KEY_PAGEUP },
    .{ "KEY_LEFT", KEY_LEFT },
    .{ "KEY_RIGHT", KEY_RIGHT },
    .{ "KEY_END", KEY_END },
    .{ "KEY_DOWN", KEY_DOWN },
    .{ "KEY_PAGEDOWN", KEY_PAGEDOWN },
    .{ "KEY_INSERT", KEY_INSERT },
    .{ "KEY_DELETE", KEY_DELETE },
    .{ "KEY_MACRO", KEY_MACRO },
    .{ "KEY_MUTE", KEY_MUTE },
    .{ "KEY_VOLUMEDOWN", KEY_VOLUMEDOWN },
    .{ "KEY_VOLUMEUP", KEY_VOLUMEUP },
    .{ "KEY_POWER", KEY_POWER },
    .{ "KEY_KPEQUAL", KEY_KPEQUAL },
    .{ "KEY_KPPLUSMINUS", KEY_KPPLUSMINUS },
    .{ "KEY_PAUSE", KEY_PAUSE },
    .{ "KEY_SCALE", KEY_SCALE },
    .{ "KEY_KPCOMMA", KEY_KPCOMMA },
    .{ "KEY_HANGEUL", KEY_HANGEUL },
    .{ "KEY_HANGUEL", KEY_HANGUEL },
    .{ "KEY_HANJA", KEY_HANJA },
    .{ "KEY_YEN", KEY_YEN },
    .{ "KEY_LEFTMETA", KEY_LEFTMETA },
    .{ "KEY_RIGHTMETA", KEY_RIGHTMETA },
    .{ "KEY_COMPOSE", KEY_COMPOSE },
    .{ "KEY_STOP", KEY_STOP },
    .{ "KEY_AGAIN", KEY_AGAIN },
    .{ "KEY_PROPS", KEY_PROPS },
    .{ "KEY_UNDO", KEY_UNDO },
    .{ "KEY_FRONT", KEY_FRONT },
    .{ "KEY_COPY", KEY_COPY },
    .{ "KEY_OPEN", KEY_OPEN },
    .{ "KEY_PASTE", KEY_PASTE },
    .{ "KEY_FIND", KEY_FIND },
    .{ "KEY_CUT", KEY_CUT },
    .{ "KEY_HELP", KEY_HELP },
    .{ "KEY_MENU", KEY_MENU },
    .{ "KEY_CALC", KEY_CALC },
    .{ "KEY_SETUP", KEY_SETUP },
    .{ "KEY_SLEEP", KEY_SLEEP },
    .{ "KEY_WAKEUP", KEY_WAKEUP },
    .{ "KEY_FILE", KEY_FILE },
    .{ "KEY_SENDFILE", KEY_SENDFILE },
    .{ "KEY_DELETEFILE", KEY_DELETEFILE },
    .{ "KEY_XFER", KEY_XFER },
    .{ "KEY_PROG1", KEY_PROG1 },
    .{ "KEY_PROG2", KEY_PROG2 },
    .{ "KEY_WWW", KEY_WWW },
    .{ "KEY_MSDOS", KEY_MSDOS },
    .{ "KEY_COFFEE", KEY_COFFEE },
    .{ "KEY_SCREENLOCK", KEY_SCREENLOCK },
    .{ "KEY_ROTATE_DISPLAY", KEY_ROTATE_DISPLAY },
    .{ "KEY_DIRECTION", KEY_DIRECTION },
    .{ "KEY_CYCLEWINDOWS", KEY_CYCLEWINDOWS },
    .{ "KEY_MAIL", KEY_MAIL },
    .{ "KEY_BOOKMARKS", KEY_BOOKMARKS },
    .{ "KEY_COMPUTER", KEY_COMPUTER },
    .{ "KEY_BACK", KEY_BACK },
    .{ "KEY_FORWARD", KEY_FORWARD },
    .{ "KEY_CLOSECD", KEY_CLOSECD },
    .{ "KEY_EJECTCD", KEY_EJECTCD },
    .{ "KEY_EJECTCLOSECD", KEY_EJECTCLOSECD },
    .{ "KEY_NEXTSONG", KEY_NEXTSONG },
    .{ "KEY_PLAYPAUSE", KEY_PLAYPAUSE },
    .{ "KEY_PREVIOUSSONG", KEY_PREVIOUSSONG },
    .{ "KEY_STOPCD", KEY_STOPCD },
    .{ "KEY_RECORD", KEY_RECORD },
    .{ "KEY_REWIND", KEY_REWIND },
    .{ "KEY_PHONE", KEY_PHONE },
    .{ "KEY_ISO", KEY_ISO },
    .{ "KEY_CONFIG", KEY_CONFIG },
    .{ "KEY_HOMEPAGE", KEY_HOMEPAGE },
    .{ "KEY_REFRESH", KEY_REFRESH },
    .{ "KEY_EXIT", KEY_EXIT },
    .{ "KEY_MOVE", KEY_MOVE },
    .{ "KEY_EDIT", KEY_EDIT },
    .{ "KEY_SCROLLUP", KEY_SCROLLUP },
    .{ "KEY_SCROLLDOWN", KEY_SCROLLDOWN },
    .{ "KEY_KPLEFTPAREN", KEY_KPLEFTPAREN },
    .{ "KEY_KPRIGHTPAREN", KEY_KPRIGHTPAREN },
    .{ "KEY_NEW", KEY_NEW },
    .{ "KEY_REDO", KEY_REDO },
    .{ "KEY_F13", KEY_F13 },
    .{ "KEY_F14", KEY_F14 },
    .{ "KEY_F15", KEY_F15 },
    .{ "KEY_F16", KEY_F16 },
    .{ "KEY_F17", KEY_F17 },
    .{ "KEY_F18", KEY_F18 },
    .{ "KEY_F19", KEY_F19 },
    .{ "KEY_F20", KEY_F20 },
    .{ "KEY_F21", KEY_F21 },
    .{ "KEY_F22", KEY_F22 },
    .{ "KEY_F23", KEY_F23 },
    .{ "KEY_F24", KEY_F24 },
    .{ "KEY_PLAYCD", KEY_PLAYCD },
    .{ "KEY_PAUSECD", KEY_PAUSECD },
    .{ "KEY_PROG3", KEY_PROG3 },
    .{ "KEY_PROG4", KEY_PROG4 },
    .{ "KEY_ALL_APPLICATIONS", KEY_ALL_APPLICATIONS },
    .{ "KEY_DASHBOARD", KEY_DASHBOARD },
    .{ "KEY_SUSPEND", KEY_SUSPEND },
    .{ "KEY_CLOSE", KEY_CLOSE },
    .{ "KEY_PLAY", KEY_PLAY },
    .{ "KEY_FASTFORWARD", KEY_FASTFORWARD },
    .{ "KEY_BASSBOOST", KEY_BASSBOOST },
    .{ "KEY_PRINT", KEY_PRINT },
    .{ "KEY_HP", KEY_HP },
    .{ "KEY_CAMERA", KEY_CAMERA },
    .{ "KEY_SOUND", KEY_SOUND },
    .{ "KEY_QUESTION", KEY_QUESTION },
    .{ "KEY_EMAIL", KEY_EMAIL },
    .{ "KEY_CHAT", KEY_CHAT },
    .{ "KEY_SEARCH", KEY_SEARCH },
    .{ "KEY_CONNECT", KEY_CONNECT },
    .{ "KEY_FINANCE", KEY_FINANCE },
    .{ "KEY_SPORT", KEY_SPORT },
    .{ "KEY_SHOP", KEY_SHOP },
    .{ "KEY_ALTERASE", KEY_ALTERASE },
    .{ "KEY_CANCEL", KEY_CANCEL },
    .{ "KEY_BRIGHTNESSDOWN", KEY_BRIGHTNESSDOWN },
    .{ "KEY_BRIGHTNESSUP", KEY_BRIGHTNESSUP },
    .{ "KEY_MEDIA", KEY_MEDIA },
    .{ "KEY_SWITCHVIDEOMODE", KEY_SWITCHVIDEOMODE },
    .{ "KEY_KBDILLUMTOGGLE", KEY_KBDILLUMTOGGLE },
    .{ "KEY_KBDILLUMDOWN", KEY_KBDILLUMDOWN },
    .{ "KEY_KBDILLUMUP", KEY_KBDILLUMUP },
    .{ "KEY_SEND", KEY_SEND },
    .{ "KEY_REPLY", KEY_REPLY },
    .{ "KEY_FORWARDMAIL", KEY_FORWARDMAIL },
    .{ "KEY_SAVE", KEY_SAVE },
    .{ "KEY_DOCUMENTS", KEY_DOCUMENTS },
    .{ "KEY_BATTERY", KEY_BATTERY },
    .{ "KEY_BLUETOOTH", KEY_BLUETOOTH },
    .{ "KEY_WLAN", KEY_WLAN },
    .{ "KEY_UWB", KEY_UWB },
    .{ "KEY_UNKNOWN", KEY_UNKNOWN },
    .{ "KEY_VIDEO_NEXT", KEY_VIDEO_NEXT },
    .{ "KEY_VIDEO_PREV", KEY_VIDEO_PREV },
    .{ "KEY_BRIGHTNESS_CYCLE", KEY_BRIGHTNESS_CYCLE },
    .{ "KEY_BRIGHTNESS_AUTO", KEY_BRIGHTNESS_AUTO },
    .{ "KEY_BRIGHTNESS_ZERO", KEY_BRIGHTNESS_ZERO },
    .{ "KEY_DISPLAY_OFF", KEY_DISPLAY_OFF },
    .{ "KEY_WWAN", KEY_WWAN },
    .{ "KEY_WIMAX", KEY_WIMAX },
    .{ "KEY_RFKILL", KEY_RFKILL },
    .{ "KEY_MICMUTE", KEY_MICMUTE },
    .{ "BTN_MISC", BTN_MISC },
    .{ "BTN_0", BTN_0 },
    .{ "BTN_1", BTN_1 },
    .{ "BTN_2", BTN_2 },
    .{ "BTN_3", BTN_3 },
    .{ "BTN_4", BTN_4 },
    .{ "BTN_5", BTN_5 },
    .{ "BTN_6", BTN_6 },
    .{ "BTN_7", BTN_7 },
    .{ "BTN_8", BTN_8 },
    .{ "BTN_9", BTN_9 },
    .{ "BTN_MOUSE", BTN_MOUSE },
    .{ "BTN_LEFT", BTN_LEFT },
    .{ "BTN_RIGHT", BTN_RIGHT },
    .{ "BTN_MIDDLE", BTN_MIDDLE },
    .{ "BTN_SIDE", BTN_SIDE },
    .{ "BTN_EXTRA", BTN_EXTRA },
    .{ "BTN_FORWARD", BTN_FORWARD },
    .{ "BTN_BACK", BTN_BACK },
    .{ "BTN_TASK", BTN_TASK },
    .{ "BTN_JOYSTICK", BTN_JOYSTICK },
    .{ "BTN_TRIGGER", BTN_TRIGGER },
    .{ "BTN_THUMB", BTN_THUMB },
    .{ "BTN_THUMB2", BTN_THUMB2 },
    .{ "BTN_TOP", BTN_TOP },
    .{ "BTN_TOP2", BTN_TOP2 },
    .{ "BTN_PINKIE", BTN_PINKIE },
    .{ "BTN_BASE", BTN_BASE },
    .{ "BTN_BASE2", BTN_BASE2 },
    .{ "BTN_BASE3", BTN_BASE3 },
    .{ "BTN_BASE4", BTN_BASE4 },
    .{ "BTN_BASE5", BTN_BASE5 },
    .{ "BTN_BASE6", BTN_BASE6 },
    .{ "BTN_DEAD", BTN_DEAD },
    .{ "BTN_GAMEPAD", BTN_GAMEPAD },
    .{ "BTN_SOUTH", BTN_SOUTH },
    .{ "BTN_A", BTN_A },
    .{ "BTN_EAST", BTN_EAST },
    .{ "BTN_B", BTN_B },
    .{ "BTN_C", BTN_C },
    .{ "BTN_NORTH", BTN_NORTH },
    .{ "BTN_X", BTN_X },
    .{ "BTN_WEST", BTN_WEST },
    .{ "BTN_Y", BTN_Y },
    .{ "BTN_Z", BTN_Z },
    .{ "BTN_TL", BTN_TL },
    .{ "BTN_TR", BTN_TR },
    .{ "BTN_TL2", BTN_TL2 },
    .{ "BTN_TR2", BTN_TR2 },
    .{ "BTN_SELECT", BTN_SELECT },
    .{ "BTN_START", BTN_START },
    .{ "BTN_MODE", BTN_MODE },
    .{ "BTN_THUMBL", BTN_THUMBL },
    .{ "BTN_THUMBR", BTN_THUMBR },
    .{ "BTN_DIGI", BTN_DIGI },
    .{ "BTN_TOOL_PEN", BTN_TOOL_PEN },
    .{ "BTN_TOOL_RUBBER", BTN_TOOL_RUBBER },
    .{ "BTN_TOOL_BRUSH", BTN_TOOL_BRUSH },
    .{ "BTN_TOOL_PENCIL", BTN_TOOL_PENCIL },
    .{ "BTN_TOOL_AIRBRUSH", BTN_TOOL_AIRBRUSH },
    .{ "BTN_TOOL_FINGER", BTN_TOOL_FINGER },
    .{ "BTN_TOOL_MOUSE", BTN_TOOL_MOUSE },
    .{ "BTN_TOOL_LENS", BTN_TOOL_LENS },
    .{ "BTN_TOOL_QUINTTAP", BTN_TOOL_QUINTTAP },
    .{ "BTN_STYLUS3", BTN_STYLUS3 },
    .{ "BTN_TOUCH", BTN_TOUCH },
    .{ "BTN_STYLUS", BTN_STYLUS },
    .{ "BTN_STYLUS2", BTN_STYLUS2 },
    .{ "BTN_TOOL_DOUBLETAP", BTN_TOOL_DOUBLETAP },
    .{ "BTN_TOOL_TRIPLETAP", BTN_TOOL_TRIPLETAP },
    .{ "BTN_TOOL_QUADTAP", BTN_TOOL_QUADTAP },
    .{ "BTN_WHEEL", BTN_WHEEL },
    .{ "BTN_GEAR_DOWN", BTN_GEAR_DOWN },
    .{ "BTN_GEAR_UP", BTN_GEAR_UP },
    .{ "KEY_OK", KEY_OK },
    .{ "KEY_SELECT", KEY_SELECT },
    .{ "KEY_GOTO", KEY_GOTO },
    .{ "KEY_CLEAR", KEY_CLEAR },
    .{ "KEY_POWER2", KEY_POWER2 },
    .{ "KEY_OPTION", KEY_OPTION },
    .{ "KEY_INFO", KEY_INFO },
    .{ "KEY_TIME", KEY_TIME },
    .{ "KEY_VENDOR", KEY_VENDOR },
    .{ "KEY_ARCHIVE", KEY_ARCHIVE },
    .{ "KEY_PROGRAM", KEY_PROGRAM },
    .{ "KEY_CHANNEL", KEY_CHANNEL },
    .{ "KEY_FAVORITES", KEY_FAVORITES },
    .{ "KEY_EPG", KEY_EPG },
    .{ "KEY_PVR", KEY_PVR },
    .{ "KEY_MHP", KEY_MHP },
    .{ "KEY_LANGUAGE", KEY_LANGUAGE },
    .{ "KEY_TITLE", KEY_TITLE },
    .{ "KEY_SUBTITLE", KEY_SUBTITLE },
    .{ "KEY_ANGLE", KEY_ANGLE },
    .{ "KEY_FULL_SCREEN", KEY_FULL_SCREEN },
    .{ "KEY_ZOOM", KEY_ZOOM },
    .{ "KEY_MODE", KEY_MODE },
    .{ "KEY_KEYBOARD", KEY_KEYBOARD },
    .{ "KEY_ASPECT_RATIO", KEY_ASPECT_RATIO },
    .{ "KEY_SCREEN", KEY_SCREEN },
    .{ "KEY_PC", KEY_PC },
    .{ "KEY_TV", KEY_TV },
    .{ "KEY_TV2", KEY_TV2 },
    .{ "KEY_VCR", KEY_VCR },
    .{ "KEY_VCR2", KEY_VCR2 },
    .{ "KEY_SAT", KEY_SAT },
    .{ "KEY_SAT2", KEY_SAT2 },
    .{ "KEY_CD", KEY_CD },
    .{ "KEY_TAPE", KEY_TAPE },
    .{ "KEY_RADIO", KEY_RADIO },
    .{ "KEY_TUNER", KEY_TUNER },
    .{ "KEY_PLAYER", KEY_PLAYER },
    .{ "KEY_TEXT", KEY_TEXT },
    .{ "KEY_DVD", KEY_DVD },
    .{ "KEY_AUX", KEY_AUX },
    .{ "KEY_MP3", KEY_MP3 },
    .{ "KEY_AUDIO", KEY_AUDIO },
    .{ "KEY_VIDEO", KEY_VIDEO },
    .{ "KEY_DIRECTORY", KEY_DIRECTORY },
    .{ "KEY_LIST", KEY_LIST },
    .{ "KEY_MEMO", KEY_MEMO },
    .{ "KEY_CALENDAR", KEY_CALENDAR },
    .{ "KEY_RED", KEY_RED },
    .{ "KEY_GREEN", KEY_GREEN },
    .{ "KEY_YELLOW", KEY_YELLOW },
    .{ "KEY_BLUE", KEY_BLUE },
    .{ "KEY_CHANNELUP", KEY_CHANNELUP },
    .{ "KEY_CHANNELDOWN", KEY_CHANNELDOWN },
    .{ "KEY_FIRST", KEY_FIRST },
    .{ "KEY_LAST", KEY_LAST },
    .{ "KEY_AB", KEY_AB },
    .{ "KEY_NEXT", KEY_NEXT },
    .{ "KEY_RESTART", KEY_RESTART },
    .{ "KEY_SLOW", KEY_SLOW },
    .{ "KEY_SHUFFLE", KEY_SHUFFLE },
    .{ "KEY_BREAK", KEY_BREAK },
    .{ "KEY_PREVIOUS", KEY_PREVIOUS },
    .{ "KEY_DIGITS", KEY_DIGITS },
    .{ "KEY_TEEN", KEY_TEEN },
    .{ "KEY_TWEN", KEY_TWEN },
    .{ "KEY_VIDEOPHONE", KEY_VIDEOPHONE },
    .{ "KEY_GAMES", KEY_GAMES },
    .{ "KEY_ZOOMIN", KEY_ZOOMIN },
    .{ "KEY_ZOOMOUT", KEY_ZOOMOUT },
    .{ "KEY_ZOOMRESET", KEY_ZOOMRESET },
    .{ "KEY_WORDPROCESSOR", KEY_WORDPROCESSOR },
    .{ "KEY_EDITOR", KEY_EDITOR },
    .{ "KEY_SPREADSHEET", KEY_SPREADSHEET },
    .{ "KEY_GRAPHICSEDITOR", KEY_GRAPHICSEDITOR },
    .{ "KEY_PRESENTATION", KEY_PRESENTATION },
    .{ "KEY_DATABASE", KEY_DATABASE },
    .{ "KEY_NEWS", KEY_NEWS },
    .{ "KEY_VOICEMAIL", KEY_VOICEMAIL },
    .{ "KEY_ADDRESSBOOK", KEY_ADDRESSBOOK },
    .{ "KEY_MESSENGER", KEY_MESSENGER },
    .{ "KEY_DISPLAYTOGGLE", KEY_DISPLAYTOGGLE },
    .{ "KEY_BRIGHTNESS_TOGGLE", KEY_BRIGHTNESS_TOGGLE },
    .{ "KEY_SPELLCHECK", KEY_SPELLCHECK },
    .{ "KEY_LOGOFF", KEY_LOGOFF },
    .{ "KEY_DOLLAR", KEY_DOLLAR },
    .{ "KEY_EURO", KEY_EURO },
    .{ "KEY_FRAMEBACK", KEY_FRAMEBACK },
    .{ "KEY_FRAMEFORWARD", KEY_FRAMEFORWARD },
    .{ "KEY_CONTEXT_MENU", KEY_CONTEXT_MENU },
    .{ "KEY_MEDIA_REPEAT", KEY_MEDIA_REPEAT },
    .{ "KEY_10CHANNELSUP", KEY_10CHANNELSUP },
    .{ "KEY_10CHANNELSDOWN", KEY_10CHANNELSDOWN },
    .{ "KEY_IMAGES", KEY_IMAGES },
    .{ "KEY_NOTIFICATION_CENTER", KEY_NOTIFICATION_CENTER },
    .{ "KEY_PICKUP_PHONE", KEY_PICKUP_PHONE },
    .{ "KEY_HANGUP_PHONE", KEY_HANGUP_PHONE },
    .{ "KEY_LINK_PHONE", KEY_LINK_PHONE },
    .{ "KEY_DEL_EOL", KEY_DEL_EOL },
    .{ "KEY_DEL_EOS", KEY_DEL_EOS },
    .{ "KEY_INS_LINE", KEY_INS_LINE },
    .{ "KEY_DEL_LINE", KEY_DEL_LINE },
    .{ "KEY_FN", KEY_FN },
    .{ "KEY_FN_ESC", KEY_FN_ESC },
    .{ "KEY_FN_F1", KEY_FN_F1 },
    .{ "KEY_FN_F2", KEY_FN_F2 },
    .{ "KEY_FN_F3", KEY_FN_F3 },
    .{ "KEY_FN_F4", KEY_FN_F4 },
    .{ "KEY_FN_F5", KEY_FN_F5 },
    .{ "KEY_FN_F6", KEY_FN_F6 },
    .{ "KEY_FN_F7", KEY_FN_F7 },
    .{ "KEY_FN_F8", KEY_FN_F8 },
    .{ "KEY_FN_F9", KEY_FN_F9 },
    .{ "KEY_FN_F10", KEY_FN_F10 },
    .{ "KEY_FN_F11", KEY_FN_F11 },
    .{ "KEY_FN_F12", KEY_FN_F12 },
    .{ "KEY_FN_1", KEY_FN_1 },
    .{ "KEY_FN_2", KEY_FN_2 },
    .{ "KEY_FN_D", KEY_FN_D },
    .{ "KEY_FN_E", KEY_FN_E },
    .{ "KEY_FN_F", KEY_FN_F },
    .{ "KEY_FN_S", KEY_FN_S },
    .{ "KEY_FN_B", KEY_FN_B },
    .{ "KEY_FN_RIGHT_SHIFT", KEY_FN_RIGHT_SHIFT },
    .{ "KEY_BRL_DOT1", KEY_BRL_DOT1 },
    .{ "KEY_BRL_DOT2", KEY_BRL_DOT2 },
    .{ "KEY_BRL_DOT3", KEY_BRL_DOT3 },
    .{ "KEY_BRL_DOT4", KEY_BRL_DOT4 },
    .{ "KEY_BRL_DOT5", KEY_BRL_DOT5 },
    .{ "KEY_BRL_DOT6", KEY_BRL_DOT6 },
    .{ "KEY_BRL_DOT7", KEY_BRL_DOT7 },
    .{ "KEY_BRL_DOT8", KEY_BRL_DOT8 },
    .{ "KEY_BRL_DOT9", KEY_BRL_DOT9 },
    .{ "KEY_BRL_DOT10", KEY_BRL_DOT10 },
    .{ "KEY_NUMERIC_0", KEY_NUMERIC_0 },
    .{ "KEY_NUMERIC_1", KEY_NUMERIC_1 },
    .{ "KEY_NUMERIC_2", KEY_NUMERIC_2 },
    .{ "KEY_NUMERIC_3", KEY_NUMERIC_3 },
    .{ "KEY_NUMERIC_4", KEY_NUMERIC_4 },
    .{ "KEY_NUMERIC_5", KEY_NUMERIC_5 },
    .{ "KEY_NUMERIC_6", KEY_NUMERIC_6 },
    .{ "KEY_NUMERIC_7", KEY_NUMERIC_7 },
    .{ "KEY_NUMERIC_8", KEY_NUMERIC_8 },
    .{ "KEY_NUMERIC_9", KEY_NUMERIC_9 },
    .{ "KEY_NUMERIC_STAR", KEY_NUMERIC_STAR },
    .{ "KEY_NUMERIC_POUND", KEY_NUMERIC_POUND },
    .{ "KEY_NUMERIC_A", KEY_NUMERIC_A },
    .{ "KEY_NUMERIC_B", KEY_NUMERIC_B },
    .{ "KEY_NUMERIC_C", KEY_NUMERIC_C },
    .{ "KEY_NUMERIC_D", KEY_NUMERIC_D },
    .{ "KEY_CAMERA_FOCUS", KEY_CAMERA_FOCUS },
    .{ "KEY_WPS_BUTTON", KEY_WPS_BUTTON },
    .{ "KEY_TOUCHPAD_TOGGLE", KEY_TOUCHPAD_TOGGLE },
    .{ "KEY_TOUCHPAD_ON", KEY_TOUCHPAD_ON },
    .{ "KEY_TOUCHPAD_OFF", KEY_TOUCHPAD_OFF },
    .{ "KEY_CAMERA_ZOOMIN", KEY_CAMERA_ZOOMIN },
    .{ "KEY_CAMERA_ZOOMOUT", KEY_CAMERA_ZOOMOUT },
    .{ "KEY_CAMERA_UP", KEY_CAMERA_UP },
    .{ "KEY_CAMERA_DOWN", KEY_CAMERA_DOWN },
    .{ "KEY_CAMERA_LEFT", KEY_CAMERA_LEFT },
    .{ "KEY_CAMERA_RIGHT", KEY_CAMERA_RIGHT },
    .{ "KEY_ATTENDANT_ON", KEY_ATTENDANT_ON },
    .{ "KEY_ATTENDANT_OFF", KEY_ATTENDANT_OFF },
    .{ "KEY_ATTENDANT_TOGGLE", KEY_ATTENDANT_TOGGLE },
    .{ "KEY_LIGHTS_TOGGLE", KEY_LIGHTS_TOGGLE },
    .{ "BTN_DPAD_UP", BTN_DPAD_UP },
    .{ "BTN_DPAD_DOWN", BTN_DPAD_DOWN },
    .{ "BTN_DPAD_LEFT", BTN_DPAD_LEFT },
    .{ "BTN_DPAD_RIGHT", BTN_DPAD_RIGHT },
    .{ "BTN_GRIPL", BTN_GRIPL },
    .{ "BTN_GRIPR", BTN_GRIPR },
    .{ "BTN_GRIPL2", BTN_GRIPL2 },
    .{ "BTN_GRIPR2", BTN_GRIPR2 },
    .{ "KEY_ALS_TOGGLE", KEY_ALS_TOGGLE },
    .{ "KEY_ROTATE_LOCK_TOGGLE", KEY_ROTATE_LOCK_TOGGLE },
    .{ "KEY_REFRESH_RATE_TOGGLE", KEY_REFRESH_RATE_TOGGLE },
    .{ "KEY_BUTTONCONFIG", KEY_BUTTONCONFIG },
    .{ "KEY_TASKMANAGER", KEY_TASKMANAGER },
    .{ "KEY_JOURNAL", KEY_JOURNAL },
    .{ "KEY_CONTROLPANEL", KEY_CONTROLPANEL },
    .{ "KEY_APPSELECT", KEY_APPSELECT },
    .{ "KEY_SCREENSAVER", KEY_SCREENSAVER },
    .{ "KEY_VOICECOMMAND", KEY_VOICECOMMAND },
    .{ "KEY_ASSISTANT", KEY_ASSISTANT },
    .{ "KEY_KBD_LAYOUT_NEXT", KEY_KBD_LAYOUT_NEXT },
    .{ "KEY_EMOJI_PICKER", KEY_EMOJI_PICKER },
    .{ "KEY_DICTATE", KEY_DICTATE },
    .{ "KEY_CAMERA_ACCESS_ENABLE", KEY_CAMERA_ACCESS_ENABLE },
    .{ "KEY_CAMERA_ACCESS_DISABLE", KEY_CAMERA_ACCESS_DISABLE },
    .{ "KEY_CAMERA_ACCESS_TOGGLE", KEY_CAMERA_ACCESS_TOGGLE },
    .{ "KEY_ACCESSIBILITY", KEY_ACCESSIBILITY },
    .{ "KEY_DO_NOT_DISTURB", KEY_DO_NOT_DISTURB },
    .{ "KEY_BRIGHTNESS_MIN", KEY_BRIGHTNESS_MIN },
    .{ "KEY_BRIGHTNESS_MAX", KEY_BRIGHTNESS_MAX },
    .{ "KEY_EPRIVACY_SCREEN_ON", KEY_EPRIVACY_SCREEN_ON },
    .{ "KEY_EPRIVACY_SCREEN_OFF", KEY_EPRIVACY_SCREEN_OFF },
    .{ "KEY_ACTION_ON_SELECTION", KEY_ACTION_ON_SELECTION },
    .{ "KEY_CONTEXTUAL_INSERT", KEY_CONTEXTUAL_INSERT },
    .{ "KEY_CONTEXTUAL_QUERY", KEY_CONTEXTUAL_QUERY },
    .{ "KEY_KBDINPUTASSIST_PREV", KEY_KBDINPUTASSIST_PREV },
    .{ "KEY_KBDINPUTASSIST_NEXT", KEY_KBDINPUTASSIST_NEXT },
    .{ "KEY_KBDINPUTASSIST_PREVGROUP", KEY_KBDINPUTASSIST_PREVGROUP },
    .{ "KEY_KBDINPUTASSIST_NEXTGROUP", KEY_KBDINPUTASSIST_NEXTGROUP },
    .{ "KEY_KBDINPUTASSIST_ACCEPT", KEY_KBDINPUTASSIST_ACCEPT },
    .{ "KEY_KBDINPUTASSIST_CANCEL", KEY_KBDINPUTASSIST_CANCEL },
    .{ "KEY_RIGHT_UP", KEY_RIGHT_UP },
    .{ "KEY_RIGHT_DOWN", KEY_RIGHT_DOWN },
    .{ "KEY_LEFT_UP", KEY_LEFT_UP },
    .{ "KEY_LEFT_DOWN", KEY_LEFT_DOWN },
    .{ "KEY_ROOT_MENU", KEY_ROOT_MENU },
    .{ "KEY_MEDIA_TOP_MENU", KEY_MEDIA_TOP_MENU },
    .{ "KEY_NUMERIC_11", KEY_NUMERIC_11 },
    .{ "KEY_NUMERIC_12", KEY_NUMERIC_12 },
    .{ "KEY_AUDIO_DESC", KEY_AUDIO_DESC },
    .{ "KEY_3D_MODE", KEY_3D_MODE },
    .{ "KEY_NEXT_FAVORITE", KEY_NEXT_FAVORITE },
    .{ "KEY_STOP_RECORD", KEY_STOP_RECORD },
    .{ "KEY_PAUSE_RECORD", KEY_PAUSE_RECORD },
    .{ "KEY_VOD", KEY_VOD },
    .{ "KEY_UNMUTE", KEY_UNMUTE },
    .{ "KEY_FASTREVERSE", KEY_FASTREVERSE },
    .{ "KEY_SLOWREVERSE", KEY_SLOWREVERSE },
    .{ "KEY_DATA", KEY_DATA },
    .{ "KEY_ONSCREEN_KEYBOARD", KEY_ONSCREEN_KEYBOARD },
    .{ "KEY_PRIVACY_SCREEN_TOGGLE", KEY_PRIVACY_SCREEN_TOGGLE },
    .{ "KEY_SELECTIVE_SCREENSHOT", KEY_SELECTIVE_SCREENSHOT },
    .{ "KEY_NEXT_ELEMENT", KEY_NEXT_ELEMENT },
    .{ "KEY_PREVIOUS_ELEMENT", KEY_PREVIOUS_ELEMENT },
    .{ "KEY_AUTOPILOT_ENGAGE_TOGGLE", KEY_AUTOPILOT_ENGAGE_TOGGLE },
    .{ "KEY_MARK_WAYPOINT", KEY_MARK_WAYPOINT },
    .{ "KEY_SOS", KEY_SOS },
    .{ "KEY_NAV_CHART", KEY_NAV_CHART },
    .{ "KEY_FISHING_CHART", KEY_FISHING_CHART },
    .{ "KEY_SINGLE_RANGE_RADAR", KEY_SINGLE_RANGE_RADAR },
    .{ "KEY_DUAL_RANGE_RADAR", KEY_DUAL_RANGE_RADAR },
    .{ "KEY_RADAR_OVERLAY", KEY_RADAR_OVERLAY },
    .{ "KEY_TRADITIONAL_SONAR", KEY_TRADITIONAL_SONAR },
    .{ "KEY_CLEARVU_SONAR", KEY_CLEARVU_SONAR },
    .{ "KEY_SIDEVU_SONAR", KEY_SIDEVU_SONAR },
    .{ "KEY_NAV_INFO", KEY_NAV_INFO },
    .{ "KEY_BRIGHTNESS_MENU", KEY_BRIGHTNESS_MENU },
    .{ "KEY_MACRO1", KEY_MACRO1 },
    .{ "KEY_MACRO2", KEY_MACRO2 },
    .{ "KEY_MACRO3", KEY_MACRO3 },
    .{ "KEY_MACRO4", KEY_MACRO4 },
    .{ "KEY_MACRO5", KEY_MACRO5 },
    .{ "KEY_MACRO6", KEY_MACRO6 },
    .{ "KEY_MACRO7", KEY_MACRO7 },
    .{ "KEY_MACRO8", KEY_MACRO8 },
    .{ "KEY_MACRO9", KEY_MACRO9 },
    .{ "KEY_MACRO10", KEY_MACRO10 },
    .{ "KEY_MACRO11", KEY_MACRO11 },
    .{ "KEY_MACRO12", KEY_MACRO12 },
    .{ "KEY_MACRO13", KEY_MACRO13 },
    .{ "KEY_MACRO14", KEY_MACRO14 },
    .{ "KEY_MACRO15", KEY_MACRO15 },
    .{ "KEY_MACRO16", KEY_MACRO16 },
    .{ "KEY_MACRO17", KEY_MACRO17 },
    .{ "KEY_MACRO18", KEY_MACRO18 },
    .{ "KEY_MACRO19", KEY_MACRO19 },
    .{ "KEY_MACRO20", KEY_MACRO20 },
    .{ "KEY_MACRO21", KEY_MACRO21 },
    .{ "KEY_MACRO22", KEY_MACRO22 },
    .{ "KEY_MACRO23", KEY_MACRO23 },
    .{ "KEY_MACRO24", KEY_MACRO24 },
    .{ "KEY_MACRO25", KEY_MACRO25 },
    .{ "KEY_MACRO26", KEY_MACRO26 },
    .{ "KEY_MACRO27", KEY_MACRO27 },
    .{ "KEY_MACRO28", KEY_MACRO28 },
    .{ "KEY_MACRO29", KEY_MACRO29 },
    .{ "KEY_MACRO30", KEY_MACRO30 },
    .{ "KEY_MACRO_RECORD_START", KEY_MACRO_RECORD_START },
    .{ "KEY_MACRO_RECORD_STOP", KEY_MACRO_RECORD_STOP },
    .{ "KEY_MACRO_PRESET_CYCLE", KEY_MACRO_PRESET_CYCLE },
    .{ "KEY_MACRO_PRESET1", KEY_MACRO_PRESET1 },
    .{ "KEY_MACRO_PRESET2", KEY_MACRO_PRESET2 },
    .{ "KEY_MACRO_PRESET3", KEY_MACRO_PRESET3 },
    .{ "KEY_KBD_LCD_MENU1", KEY_KBD_LCD_MENU1 },
    .{ "KEY_KBD_LCD_MENU2", KEY_KBD_LCD_MENU2 },
    .{ "KEY_KBD_LCD_MENU3", KEY_KBD_LCD_MENU3 },
    .{ "KEY_KBD_LCD_MENU4", KEY_KBD_LCD_MENU4 },
    .{ "KEY_KBD_LCD_MENU5", KEY_KBD_LCD_MENU5 },
    .{ "KEY_PERFORMANCE", KEY_PERFORMANCE },
    .{ "BTN_TRIGGER_HAPPY", BTN_TRIGGER_HAPPY },
    .{ "BTN_TRIGGER_HAPPY1", BTN_TRIGGER_HAPPY1 },
    .{ "BTN_TRIGGER_HAPPY2", BTN_TRIGGER_HAPPY2 },
    .{ "BTN_TRIGGER_HAPPY3", BTN_TRIGGER_HAPPY3 },
    .{ "BTN_TRIGGER_HAPPY4", BTN_TRIGGER_HAPPY4 },
    .{ "BTN_TRIGGER_HAPPY5", BTN_TRIGGER_HAPPY5 },
    .{ "BTN_TRIGGER_HAPPY6", BTN_TRIGGER_HAPPY6 },
    .{ "BTN_TRIGGER_HAPPY7", BTN_TRIGGER_HAPPY7 },
    .{ "BTN_TRIGGER_HAPPY8", BTN_TRIGGER_HAPPY8 },
    .{ "BTN_TRIGGER_HAPPY9", BTN_TRIGGER_HAPPY9 },
    .{ "BTN_TRIGGER_HAPPY10", BTN_TRIGGER_HAPPY10 },
    .{ "BTN_TRIGGER_HAPPY11", BTN_TRIGGER_HAPPY11 },
    .{ "BTN_TRIGGER_HAPPY12", BTN_TRIGGER_HAPPY12 },
    .{ "BTN_TRIGGER_HAPPY13", BTN_TRIGGER_HAPPY13 },
    .{ "BTN_TRIGGER_HAPPY14", BTN_TRIGGER_HAPPY14 },
    .{ "BTN_TRIGGER_HAPPY15", BTN_TRIGGER_HAPPY15 },
    .{ "BTN_TRIGGER_HAPPY16", BTN_TRIGGER_HAPPY16 },
    .{ "BTN_TRIGGER_HAPPY17", BTN_TRIGGER_HAPPY17 },
    .{ "BTN_TRIGGER_HAPPY18", BTN_TRIGGER_HAPPY18 },
    .{ "BTN_TRIGGER_HAPPY19", BTN_TRIGGER_HAPPY19 },
    .{ "BTN_TRIGGER_HAPPY20", BTN_TRIGGER_HAPPY20 },
    .{ "BTN_TRIGGER_HAPPY21", BTN_TRIGGER_HAPPY21 },
    .{ "BTN_TRIGGER_HAPPY22", BTN_TRIGGER_HAPPY22 },
    .{ "BTN_TRIGGER_HAPPY23", BTN_TRIGGER_HAPPY23 },
    .{ "BTN_TRIGGER_HAPPY24", BTN_TRIGGER_HAPPY24 },
    .{ "BTN_TRIGGER_HAPPY25", BTN_TRIGGER_HAPPY25 },
    .{ "BTN_TRIGGER_HAPPY26", BTN_TRIGGER_HAPPY26 },
    .{ "BTN_TRIGGER_HAPPY27", BTN_TRIGGER_HAPPY27 },
    .{ "BTN_TRIGGER_HAPPY28", BTN_TRIGGER_HAPPY28 },
    .{ "BTN_TRIGGER_HAPPY29", BTN_TRIGGER_HAPPY29 },
    .{ "BTN_TRIGGER_HAPPY30", BTN_TRIGGER_HAPPY30 },
    .{ "BTN_TRIGGER_HAPPY31", BTN_TRIGGER_HAPPY31 },
    .{ "BTN_TRIGGER_HAPPY32", BTN_TRIGGER_HAPPY32 },
    .{ "BTN_TRIGGER_HAPPY33", BTN_TRIGGER_HAPPY33 },
    .{ "BTN_TRIGGER_HAPPY34", BTN_TRIGGER_HAPPY34 },
    .{ "BTN_TRIGGER_HAPPY35", BTN_TRIGGER_HAPPY35 },
    .{ "BTN_TRIGGER_HAPPY36", BTN_TRIGGER_HAPPY36 },
    .{ "BTN_TRIGGER_HAPPY37", BTN_TRIGGER_HAPPY37 },
    .{ "BTN_TRIGGER_HAPPY38", BTN_TRIGGER_HAPPY38 },
    .{ "BTN_TRIGGER_HAPPY39", BTN_TRIGGER_HAPPY39 },
    .{ "BTN_TRIGGER_HAPPY40", BTN_TRIGGER_HAPPY40 },
    .{ "KEY_MIN_INTERESTING", KEY_MIN_INTERESTING },
    .{ "KEY_MAX", KEY_MAX },
    .{ "KEY_CNT", KEY_CNT },
    .{ "REL_X", REL_X },
    .{ "REL_Y", REL_Y },
    .{ "REL_Z", REL_Z },
    .{ "REL_RX", REL_RX },
    .{ "REL_RY", REL_RY },
    .{ "REL_RZ", REL_RZ },
    .{ "REL_HWHEEL", REL_HWHEEL },
    .{ "REL_DIAL", REL_DIAL },
    .{ "REL_WHEEL", REL_WHEEL },
    .{ "REL_MISC", REL_MISC },
    .{ "REL_RESERVED", REL_RESERVED },
    .{ "REL_WHEEL_HI_RES", REL_WHEEL_HI_RES },
    .{ "REL_HWHEEL_HI_RES", REL_HWHEEL_HI_RES },
    .{ "REL_MAX", REL_MAX },
    .{ "REL_CNT", REL_CNT },
    .{ "ABS_X", ABS_X },
    .{ "ABS_Y", ABS_Y },
    .{ "ABS_Z", ABS_Z },
    .{ "ABS_RX", ABS_RX },
    .{ "ABS_RY", ABS_RY },
    .{ "ABS_RZ", ABS_RZ },
    .{ "ABS_THROTTLE", ABS_THROTTLE },
    .{ "ABS_RUDDER", ABS_RUDDER },
    .{ "ABS_WHEEL", ABS_WHEEL },
    .{ "ABS_GAS", ABS_GAS },
    .{ "ABS_BRAKE", ABS_BRAKE },
    .{ "ABS_HAT0X", ABS_HAT0X },
    .{ "ABS_HAT0Y", ABS_HAT0Y },
    .{ "ABS_HAT1X", ABS_HAT1X },
    .{ "ABS_HAT1Y", ABS_HAT1Y },
    .{ "ABS_HAT2X", ABS_HAT2X },
    .{ "ABS_HAT2Y", ABS_HAT2Y },
    .{ "ABS_HAT3X", ABS_HAT3X },
    .{ "ABS_HAT3Y", ABS_HAT3Y },
    .{ "ABS_PRESSURE", ABS_PRESSURE },
    .{ "ABS_DISTANCE", ABS_DISTANCE },
    .{ "ABS_TILT_X", ABS_TILT_X },
    .{ "ABS_TILT_Y", ABS_TILT_Y },
    .{ "ABS_TOOL_WIDTH", ABS_TOOL_WIDTH },
    .{ "ABS_VOLUME", ABS_VOLUME },
    .{ "ABS_PROFILE", ABS_PROFILE },
    .{ "ABS_SND_PROFILE", ABS_SND_PROFILE },
    .{ "ABS_MISC", ABS_MISC },
    .{ "ABS_RESERVED", ABS_RESERVED },
    .{ "ABS_MT_SLOT", ABS_MT_SLOT },
    .{ "ABS_MT_TOUCH_MAJOR", ABS_MT_TOUCH_MAJOR },
    .{ "ABS_MT_TOUCH_MINOR", ABS_MT_TOUCH_MINOR },
    .{ "ABS_MT_WIDTH_MAJOR", ABS_MT_WIDTH_MAJOR },
    .{ "ABS_MT_WIDTH_MINOR", ABS_MT_WIDTH_MINOR },
    .{ "ABS_MT_ORIENTATION", ABS_MT_ORIENTATION },
    .{ "ABS_MT_POSITION_X", ABS_MT_POSITION_X },
    .{ "ABS_MT_POSITION_Y", ABS_MT_POSITION_Y },
    .{ "ABS_MT_TOOL_TYPE", ABS_MT_TOOL_TYPE },
    .{ "ABS_MT_BLOB_ID", ABS_MT_BLOB_ID },
    .{ "ABS_MT_TRACKING_ID", ABS_MT_TRACKING_ID },
    .{ "ABS_MT_PRESSURE", ABS_MT_PRESSURE },
    .{ "ABS_MT_DISTANCE", ABS_MT_DISTANCE },
    .{ "ABS_MT_TOOL_X", ABS_MT_TOOL_X },
    .{ "ABS_MT_TOOL_Y", ABS_MT_TOOL_Y },
    .{ "ABS_MAX", ABS_MAX },
    .{ "ABS_CNT", ABS_CNT },
    .{ "SW_LID", SW_LID },
    .{ "SW_TABLET_MODE", SW_TABLET_MODE },
    .{ "SW_HEADPHONE_INSERT", SW_HEADPHONE_INSERT },
    .{ "SW_RFKILL_ALL", SW_RFKILL_ALL },
    .{ "SW_RADIO", SW_RADIO },
    .{ "SW_MICROPHONE_INSERT", SW_MICROPHONE_INSERT },
    .{ "SW_DOCK", SW_DOCK },
    .{ "SW_LINEOUT_INSERT", SW_LINEOUT_INSERT },
    .{ "SW_JACK_PHYSICAL_INSERT", SW_JACK_PHYSICAL_INSERT },
    .{ "SW_VIDEOOUT_INSERT", SW_VIDEOOUT_INSERT },
    .{ "SW_CAMERA_LENS_COVER", SW_CAMERA_LENS_COVER },
    .{ "SW_KEYPAD_SLIDE", SW_KEYPAD_SLIDE },
    .{ "SW_FRONT_PROXIMITY", SW_FRONT_PROXIMITY },
    .{ "SW_ROTATE_LOCK", SW_ROTATE_LOCK },
    .{ "SW_LINEIN_INSERT", SW_LINEIN_INSERT },
    .{ "SW_MUTE_DEVICE", SW_MUTE_DEVICE },
    .{ "SW_PEN_INSERTED", SW_PEN_INSERTED },
    .{ "SW_MACHINE_COVER", SW_MACHINE_COVER },
    .{ "SW_USB_INSERT", SW_USB_INSERT },
    .{ "SW_MAX", SW_MAX },
    .{ "SW_CNT", SW_CNT },
    .{ "MSC_SERIAL", MSC_SERIAL },
    .{ "MSC_PULSELED", MSC_PULSELED },
    .{ "MSC_GESTURE", MSC_GESTURE },
    .{ "MSC_RAW", MSC_RAW },
    .{ "MSC_SCAN", MSC_SCAN },
    .{ "MSC_TIMESTAMP", MSC_TIMESTAMP },
    .{ "MSC_MAX", MSC_MAX },
    .{ "MSC_CNT", MSC_CNT },
    .{ "LED_NUML", LED_NUML },
    .{ "LED_CAPSL", LED_CAPSL },
    .{ "LED_SCROLLL", LED_SCROLLL },
    .{ "LED_COMPOSE", LED_COMPOSE },
    .{ "LED_KANA", LED_KANA },
    .{ "LED_SLEEP", LED_SLEEP },
    .{ "LED_SUSPEND", LED_SUSPEND },
    .{ "LED_MUTE", LED_MUTE },
    .{ "LED_MISC", LED_MISC },
    .{ "LED_MAIL", LED_MAIL },
    .{ "LED_CHARGING", LED_CHARGING },
    .{ "LED_MAX", LED_MAX },
    .{ "LED_CNT", LED_CNT },
    .{ "REP_DELAY", REP_DELAY },
    .{ "REP_PERIOD", REP_PERIOD },
    .{ "REP_MAX", REP_MAX },
    .{ "REP_CNT", REP_CNT },
    .{ "SND_CLICK", SND_CLICK },
    .{ "SND_BELL", SND_BELL },
    .{ "SND_TONE", SND_TONE },
    .{ "SND_MAX", SND_MAX },
    .{ "SND_CNT", SND_CNT },
    .{ "SND_PROFILE_SILENT", SND_PROFILE_SILENT },
    .{ "SND_PROFILE_VIBRATE", SND_PROFILE_VIBRATE },
    .{ "SND_PROFILE_RING", SND_PROFILE_RING },
});

pub fn codeFromName(name: []const u8) ?u16 {
    return KeycodeMap.get(name);
}
