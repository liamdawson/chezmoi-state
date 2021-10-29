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

for crate in "${crates[@]}"; do
  cargo install "$crate"
done
