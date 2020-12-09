#!/usr/bin/env bash

set -Eeuo pipefail

node_version="14.15.1"
node_packages=(
  terminalizer
  typescript
)

nodenv install -s "$node_version"
nodenv global "$node_version"
npm install -g "${node_packages[@]}"
