#!/usr/bin/env bash

set -Eeuo pipefail

node_version="14.15.4"
node_packages=(
  typescript
)

nodenv install -s "$node_version"
nodenv global "$node_version"
npm install -g "${node_packages[@]}"
nodenv rehash || true
