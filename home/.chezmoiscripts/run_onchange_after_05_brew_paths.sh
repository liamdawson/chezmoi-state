#!/usr/bin/env bash

set -Eeuo pipefail

test -x /opt/homebrew/bin/brew || exit 0

if ! [[ -f /etc/paths.d/brew-bin ]] || ! [[ -f /etc/paths.d/brew-sbin ]]; then
	echo "Setting up Apple Silicon brew fallback PATHs"
	echo "/opt/homebrew/bin" | sudo tee /etc/paths.d/brew-bin >/dev/null
	echo "/opt/homebrew/sbin" | sudo tee /etc/paths.d/brew-sbin >/dev/null
fi

if ! [[ -f /etc/manpaths.d/brew ]]; then
	echo "Setting up Apple Silicon brew man paths"
	echo "/opt/homebrew/share/man" | sudo tee /etc/manpaths.d/brew >/dev/null
fi
