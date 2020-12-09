#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Begin Work
# @raycast.mode compact
#
# Optional parameters:
# @raycast.icon ▶️
# @raycast.currentDirectoryPath ~
# @raycast.packageName Raycast Scripts
# @raycast.packageName Chezmoi Scripts

apps=(
  "/Applications/Firefox.app"
  "/Applications/iTerm.app"
  "/Applications/Slack.app"
  "/Applications/WorkFlowy.app"
  "/Applications/Joplin.app"
  "/Applications/DevHub.app"
)

for app in "${apps[@]}"; do
  open -g "$app"
done
