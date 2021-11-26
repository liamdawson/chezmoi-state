#!/usr/bin/env bash

set -Eeuo pipefail

defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/Library/Mobile Documents/com~apple~CloudDocs/iTerm Preferences"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
