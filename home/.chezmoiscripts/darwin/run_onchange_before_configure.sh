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

# set 24hr time

defaults write -g AppleICUForce24HourTime -bool true
# dock settings
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock "show-recents" -bool false

# turn off quick note hot corner
defaults write com.apple.dock wvous-br-corner -int 1

defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# spelling corrections, auto-punctuation etc.
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# always use expanded file dialogs
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# textedit plain text by default
defaults write com.apple.TextEdit RichText -int 0

# don't .DS_Store on removable/network locations
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

###
### Finder
###

# show hidden files
defaults write com.apple.Finder AppleShowAllFiles -bool true

# show filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# don't warn when changing filename extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# show path bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false
defaults write com.apple.finder ShowPathbar -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# keep folders on top when sorting by file name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# open new windows to home directory
defaults write com.apple.finder NewWindowTarget "PfHm"
defaults write com.apple.finder NewWindowTargetPath "file://${HOME}"

# remove tags stuff
defaults write com.apple.finder FavoriteTagNames -array ''
defaults write com.apple.finder ShowRecentTags -bool false

# apply settings changes
killall "Dock"
killall "Finder"
