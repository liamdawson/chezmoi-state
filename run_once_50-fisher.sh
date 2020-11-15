#!/usr/bin/env bash

set -Eeuo pipefail

if command -v fish >/dev/null 2>&1; then
  cat <<'EOS' | fish -i
  if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c 'fisher update'
  end
EOS
fi
