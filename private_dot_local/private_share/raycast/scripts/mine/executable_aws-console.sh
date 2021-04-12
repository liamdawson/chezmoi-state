#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title AWS Console
# @raycast.mode compact
#
# Optional parameters:
# @raycast.icon 🔐
# @raycast.currentDirectoryPath ~
# @raycast.packageName Work

set -Eeuo pipefail

{
  profile="$(aws-vault list --profiles | choose)"
  login_url="$(aws-vault login "$profile" --stdout)"
  encoded_url="${login_url//&/%26}"
  firefox_uri="ext+container:name=${profile}&url=${encoded_url}"
} >> "$HOME/.local/var/log/raycast-aws-console.stdout.log" 2>> "$HOME/.local/var/log/raycast-aws-console.stderr.log"

/Applications/Firefox.app/Contents/MacOS/firefox "$firefox_uri"
