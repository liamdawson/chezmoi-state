#!/usr/bin/env bash

set -Eeuo pipefail

if [[ "$(uname -s)" = 'Darwin' ]]; then
    if ! dscl . read "/Users/$(whoami)" UserShell | grep -q fish; then

        shell_path="$(command -v fish)"

        if [[ -x "$shell_path" ]]; then
            echo "Changing user shell to ${shell_path}:"
            sudo chsh -s "$(command -v fish)" "$(whoami)"
        fi
    fi
else
    echo "Unknown OS"
    exit 1
fi
