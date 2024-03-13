#!/usr/bin/env bash

set -euo pipefail

if ! command -v cargo-binstall >/dev/null 2>&1; then
    cargo install cargo-binstall
fi

packages=(
    cargo-cache
    cargo-outdated
    cargo-update
)

cargo binstall "${packages[@]}"
