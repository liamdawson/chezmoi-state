#!/usr/bin/env bash

set -Eeuo pipefail

crates=(
  cargo-edit
  cargo-outdated
  cargo-udeps
  cargo-update
  evcxr_jupyter
  evcxr_repl
  jwt-cli
)

if ! command -v cargo >/dev/null 2>&1; then
  if test -x ~/.cargo/bin/cargo; then
    export PATH="$HOME/.cargo/bin:$PATH"
  fi
fi

for crate in "${crates[@]}"; do
  cargo install "$crate"
done
