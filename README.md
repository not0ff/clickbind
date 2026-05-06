# clickbind
Demo tool for mapping keypresses to sound effects on linux. Made to test the new threaded io in Zig 0.16.0

## Usage
The  user needs to be in the input group to read events from `/dev/input/`. Example config is in `config.toml` file from which the program currently reads the key mappings by default.

## License
Shared under GPLv3