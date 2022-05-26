#!/usr/bin/env bash

set -Eeuo pipefail

crates=(
  cargo-edit
  cargo-outdated
  cargo-udeps
  cargo-update
  evcxr_jupyter
  evcxr_repl
  https-cert-info
  jwt-cli
)

configure_crate_updates() {
  cargo install-update-config flowistry_ide --toolchain nightly
}

# can end up with rust on path through homebrew
export RUSTUP_INIT_SKIP_PATH_CHECK="yes"

if ! command -v rustup >/dev/null 2>&1; then
  cd "$(mktemp -d)"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs >rustup-init
  chmod +x rustup-init

  ./rustup-init \
    --no-modify-path \
    --component rust-src \
    -y

  rm rustup-init

  export PATH="$HOME/.cargo/bin:$PATH"

  rustup toolchain install nightly \
    --component rust-src \
    --component rustc-dev \
    --component llvm-tools-preview
fi

if ! command -v cargo >/dev/null 2>&1; then
  if test -x ~/.cargo/bin/cargo; then
    export PATH="$HOME/.cargo/bin:$PATH"
  else
    echo "Couldn't find cargo on path, or in the default location. Exiting."
    exit 127
  fi
fi

for crate in "${crates[@]}"; do
  cargo install "$crate"
done

configure_crate_updates
