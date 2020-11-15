#!/usr/bin/env bash

set -Eeuo pipefail
# can end up with rust on path through homebrew
export RUSTUP_INIT_SKIP_PATH_CHECK="yes"

if ! command -v rustup >/dev/null 2>&1; then
  curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
fi
