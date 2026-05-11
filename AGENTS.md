# AGENTS.md — LED Name Badge (Mac Neo)

Context for AI agents working in this directory.

## What this is

Scripts to program a USB HID LED name badge (44×11 LEDs, CH546 chip).
Wraps [jnweiger/led-name-badge-ls32](https://github.com/jnweiger/led-name-badge-ls32).

## Hardware

- Vendor 0x0416 (wch.cn), Product 0x5020 (CH546)
- Shows up in `ioreg -p IOUSB` as "CH546"
- 44×11 LED array; up to 8 messages, cycles in loop mode

## Running commands

Always use the `badge` wrapper — never call the venv Python directly:

```bash
./badge "Message"
./forbin.sh          # the Colossus sequence
```

The wrapper sets `DYLD_LIBRARY_PATH=/opt/homebrew/lib` which is required on Apple Silicon
because `pyhidapi` hardcodes `/usr/local/lib` and won't find Homebrew's `libhidapi.dylib`.

## Python environment

- Venv at `.venv/` — **do not activate it**, use `./badge` instead
- Dependencies: `pyhidapi`, `pillow` (installed in `.venv`)
- System Python: 3.14 (Homebrew) — PEP 668 blocks global pip installs; always use the venv

## Key flags

```
-m MODE       0=scroll-left 1=scroll-right 4=still 5=animation 8=laser
-s SPEED      1 (slow) to 8 (fast)
-B BRIGHTNESS 25 / 50 / 75 / 100
-b 1          blink
-a 1          animated border ("ants")
-l            list built-in icons (:heart: :happy: :ball: etc.)
```

Multiple messages get comma-separated flag values: `-m 0,8,5 -s 3,6,2 "Msg1" "Msg2" "Msg3"`

## Sequences

### `forbin.sh` — Colossus: The Forbin Project (1970)

Roger's go-to event badge sequence:

1. `"This is the voice of World Control. I bring you peace."` — slow scroll
2. `"Roger Dubar"` — laser, blink, animated border
3. Beating heart animation

## Modifying sequences

Edit `forbin.sh` to change the messages or effects. The badge stores whatever was last
uploaded and plays it until reprogrammed.
