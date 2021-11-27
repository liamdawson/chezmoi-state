#!/usr/bin/env bash

set -Eeuo pipefail

# Tap-to-click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Turn off "natural" trackpad scroll direction
defaults write -g com.apple.swipescrolldirection -bool false
