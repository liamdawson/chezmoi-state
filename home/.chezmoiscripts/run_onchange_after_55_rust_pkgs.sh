#!/usr/bin/env bash

set -euo pipefail

if ! command -v cargo >/dev/null 2>&1 && test -r "${HOME}/.cargo/env"; then
  # shellcheck disable=SC1091
  . "${HOME}/.cargo/env"
fi

if ! command -v cargo-binstall >/dev/null 2>&1; then
  cargo install cargo-binstall
fi

packages=(
  cargo-cache
  cargo-outdated
  cargo-update
  cargo-watch
  evcxr_repl
  trunk
)

cargo binstall \
  --no-confirm \
  --continue-on-failure \
  --locked \
  "${packages[@]}"
