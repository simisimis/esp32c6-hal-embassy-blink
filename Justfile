# Build a binary using esp idf docker
build:
  docker run -exec -it -v ${PWD}:/home/esp/proj --rm espressif/idf-rust:esp32c6_1.73.0.1 bash -c "cd proj && cargo build --release"

# Flash the binary to the esp32c6 board
flash:
  espflash flash target/riscv32imac-unknown-none-elf/release/esp32c6-hal-embassy-blink --monitor
