#!/usr/bin/env bash

set -Eeuo pipefail

(
  # can end up with rust on path through homebrew
  export RUSTUP_INIT_SKIP_PATH_CHECK="yes"

  if ! command -v rustup >/dev/null 2>&1; then
    cd "$(mktemp -d)"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup-init
    chmod +x rustup-init

    ./rustup-init \
      --no-modify-path \
      --component rust-src \
      -y

    rm rustup-init
  fi
)
