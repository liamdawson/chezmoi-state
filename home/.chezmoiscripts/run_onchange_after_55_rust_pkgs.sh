#!/usr/bin/env bash

set -euo pipefail

if ! command -v cargo-binstall >/dev/null 2>&1; then
    cargo install cargo-binstall
fi

packages=(
    cargo-cache
    cargo-leptos
    cargo-outdated
    cargo-update
    cargo-watch
    leptosfmt
    sea-orm-cli
    sqlx-cli
    trunk
)

cargo binstall \
  --no-confirm \
  --continue-on-failure \
  --locked \
  "${packages[@]}"
