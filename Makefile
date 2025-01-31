.PHONY: all prepare

exp:
	@ export CARGO_HOME="/home/gitpod/.cargo"

all:
	RUSTFLAGS="-C link-args=--import-memory" cargo +nightly build --release --target=wasm32-unknown-unknown
	wasm-proc --path ./target/wasm32-unknown-unknown/release/voting_app.wasm
	ls -la ./target/wasm32-unknown-unknown/release/voting_app*.wasm

prepare:
	rustup toolchain add nightly
	rustup target add wasm32-unknown-unknown --toolchain nightly
	cargo install --locked --git https://github.com/gear-tech/gear wasm-proc