#!/usr/bin/env bash

set -Eeuo pipefail

if ! command -v rustup >/dev/null 2>&1; then
  curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
fi
