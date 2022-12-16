#!/usr/bin/env bash

set -Eeuo pipefail

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# if git or curl is missing, and apt-get is found
if ! { command_exists "git" && command_exists "curl"; } && command_exists "apt-get"; then
  sudo apt-get install -y git curl
fi

# ensure homebrew is installed
if ! command -v "brew" >/dev/null 2>&1; then
  echo "Installing homebrew..."
  curl --proto "=https" --tlsv1.2 -sSf https://raw.githubusercontent.com/Homebrew/install/master/install.sh | "$(/usr/bin/env bash)"
fi

# make sure it's on path
if ! command_exists brew; then
	if [[ -d /opt/homebrew/bin ]]; then
		export PATH="/opt/homebrew/bin:${PATH}"
  elif [[ -d /home/linuxbrew/.linuxbrew/bin ]]; then
    export PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
  elif [[ -d "$HOME/.linuxbrew/bin" ]]; then
    export PATH="${HOME}/.linuxbrew/bin:${PATH}"
  fi
fi

if ! command_exists chezmoi; then
  brew install chezmoi
fi

chezmoi init --apply https://github.com/liamdawson/chezmoi-state.git
chezmoi git -- remote set-url origin --push git@github.com:/liamdawson/chezmoi-state.git

echo "Done."
