#!/usr/bin/env bash

set -eu

scripts_dir="${HOME}/.local/share/raycast/script-commands"

if ! [[ -d "$scripts_dir" ]]; then
  git clone https://github.com/raycast/script-commands.git "$scripts_dir"
else
  cd "$scripts_dir" && git pull
fi
