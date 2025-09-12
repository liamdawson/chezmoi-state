#!/usr/bin/env bash

set -eufo pipefail

if ! command -v fish >/dev/null 2>&1; then
    echo "error: fish shell is not on path"
    exit 1
fi

if ! grep -qe '[/]fish$' /etc/shells; then
    command -v fish | sudo tee -a /etc/shells
fi

if ! dscl . read "/Users/$(whoami)" UserShell | grep -q fish; then
    shell_path="$(command -v fish)"

    if [[ -x "$shell_path" ]]; then
        echo "Changing user shell to ${shell_path}:"
        chsh -s "$shell_path" "$(whoami)"
    fi
fi