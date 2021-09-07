#!/usr/bin/env bash

set -Eeuo pipefail

if ! command -v rustup >/dev/null 2>&1; then
  cd "$(mktemp -d)"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup-init
  chmod +x rustup-init

  ./rustup-init \
    --no-modify-path \
    --component rust-src \
    -y
fi

crates=(
  cargo-edit
  cargo-outdated
  cargo-udeps
  evcxr_jupyter
  evcxr_repl
)

for crate in "${crates[@]}"; do
  cargo install "$crate"
done

cat <<EOF
Some extra commands that might be relevant:

  evcxr_jupyter --install
EOF
