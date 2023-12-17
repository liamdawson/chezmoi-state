#!/usr/bin/env bash

set -euo pipefail

packages=(
    cargo-update
)

cargo install "${packages[@]}"
