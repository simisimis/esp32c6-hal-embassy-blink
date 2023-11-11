# esp32c6-hal-embassy-blink

A blink example on esp32c6 devkit using rust no std with embassy

This is an attempt to blink led in a non blocking way using esp32c6 devkit board with rust, esp-hal and embassy.
Code is for running an LED connected to GPIO5.

To use it, you need nix with flakes enabled. Then simply run:
`nix develop .`

After you enter the shell, you can simply run build command: 
`$ just build`

and flash it to your esp32c6 controller:
`$ just flash`

You can inspect command definitions in `./Justfile`.

# Credits

Huge thanks to [Rust on ESP32](https://www.youtube.com/playlist?list=PL0U7YUX2VnBFbwTi96wUB1nZzPVN3HzgS) training that I was following along to get this working.
Code is mostly taken from [esp-rs/esp32-hal examples](https://github.com/esp-rs/esp-hal/blob/main/esp32c6-hal/examples/embassy_hello_world.rs).

