#!/usr/bin/env bash

set -Eeuo pipefail

node_version="16.13.0"
node_packages=(
  typescript
)

nodenv install -s "$node_version"
nodenv global "$node_version"
npm install -g "${node_packages[@]}"
nodenv rehash || true
