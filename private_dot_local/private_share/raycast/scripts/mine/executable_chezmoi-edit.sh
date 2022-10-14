#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Edit Chezmoi State
# @raycast.mode compact
#
# Optional parameters:
# @raycast.icon 📝
# @raycast.currentDirectoryPath ~
# @raycast.packageName Environment

set -Eeuo pipefail

code --folder-uri "file://$(chezmoi source-path)" --file-uri "file://$HOME/.config/chezmoi/chezmoi.toml"
