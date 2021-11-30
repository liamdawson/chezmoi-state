#!/usr/bin/env bash

set -Eeuo pipefail

# Default to Fn keys
defaults write -g com.apple.keyboard.fnState -bool true
