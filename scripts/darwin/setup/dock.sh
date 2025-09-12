#!/bin/bash

set -euo pipefail

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock "show-recents" -bool false

unwanted_dock_items=(
    com.apple.Safari
    com.apple.MobileSMS
    com.apple.mail
    com.apple.Maps
    com.apple.Photos
    com.apple.FaceTime
    com.apple.AddressBook
    com.apple.reminders
    com.apple.Notes
    com.apple.freeform
    com.apple.Music
    com.apple.TV
    com.apple.news
    com.apple.iWork.Keynote
    com.apple.iWork.Numbers
    com.apple.iWork.Pages
    com.apple.AppStore
)

for item in "${unwanted_dock_items[@]}"; do
  dockutil --no-restart --remove "$item"
done

killall Dock
