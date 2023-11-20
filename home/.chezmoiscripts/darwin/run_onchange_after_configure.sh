#!/bin/bash

set -eufo pipefail

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

defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# apply settings changes
killall "Dock"
