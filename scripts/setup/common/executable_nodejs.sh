#!/usr/bin/env bash

set -Eeuo pipefail

global_node_version="18.2.0"
node_packages=(
  typescript
)

nodenv install -s "$global_node_version"
nodenv global "$global_node_version"
npm install -g "${node_packages[@]}"
nodenv rehash || true

# update pnpm version (due to versions that have failed under topgrade)
pnpm add -g pnpm
