#!/usr/bin/env bash

main() {
  # ask for sudo password in advance
  sudo -v
  # keep sudo fresh until script exits
  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done 2>/dev/null &

  ensure_homebrew_available
  ensure_fallback_brew_paths

  update_macos_settings

  brew bundle --no-lock --file=/dev/stdin <<EOBUNDLE
  brew "fish"
  brew "chezmoi"
  brew "age"
  cask "1password"
  cask "iterm2"
  cask "visual-studio-code"
  cask "firefox"
  cask "git-credential-manager"
EOBUNDLE
}

ensure_homebrew_available() {
  if ! command -v brew >/dev/null 2>&1; then
    if ! [[ -x /opt/homebrew/bin/brew ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      # shellcheck disable=SC2016
      echo 'eval $(/opt/homebrew/bin/brew shellenv)' >>"$HOME/.zprofile"
    fi

    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
}

ensure_fallback_brew_paths() {
  [[ -f /etc/paths.d/brew-bin ]] || (echo /opt/homebrew/bin | sudo tee /etc/paths.d/brew-bin >/dev/null)
  [[ -f /etc/paths.d/brew-sbin ]] || (echo /opt/homebrew/sbin | sudo tee /etc/paths.d/brew-sbin >/dev/null)
  [[ -f /etc/manpaths.d/brew ]] || (echo /opt/homebrew/share/man | sudo tee /etc/manpaths.d/brew >/dev/null)
}

update_macos_settings() {
  # ensure no conflicts with open settings dialogs
  osascript -e 'tell application "System Preferences" to quit'

  # mute startup sound
  sudo nvram StartupMute='%01'

  # change the default scroll direction
  defaults write -g com.apple.swipescrolldirection -bool false

  # default to F# keys instead of the special functions
  defaults write -g com.apple.keyboard.fnState -bool true

  # set maximum key repeat settings (per preferences pane)
  defaults write -g InitialKeyRepeat -int 15
  defaults write -g KeyRepeat -int 2

  # make key repeat work (instead of providing a choice of accents when holding)
  defaults write -g ApplePressAndHoldEnabled -bool false

  # dock settings
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock tilesize -int 50
  defaults write com.apple.dock "show-recents" -bool false

  # apply settings changes
  killall "Dock"
}

(
  set -eu
  main
)

rc="$?"

if [[ "$rc" -ne 0 ]]; then
  echo
  echo "*** Exited with status $rc ***"
fi
