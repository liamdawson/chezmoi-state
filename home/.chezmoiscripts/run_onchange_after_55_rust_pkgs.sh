#!/usr/bin/env bash

set -euo pipefail

packages=(
    cargo-cache
    cargo-update
)

cargo install "${packages[@]}"
