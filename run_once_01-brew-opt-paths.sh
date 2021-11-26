#!/usr/bin/env bash

set -Eeuo pipefail

test -x /opt/homebrew/bin/brew || exit 0

if ! [[ -f /etc/paths.d/brew ]]; then
  echo "Setting up M1 homebrew paths"
  echo "/opt/homebrew/bin" | sudo tee /etc/paths.d/brew >/dev/null
fi

if ! [[ -f /etc/manpaths.d/brew ]]; then
  echo "Setting up M1 homebrew man paths"
  echo "/opt/homebrew/share/man" | sudo tee /etc/manpaths.d/brew >/dev/null
fi
