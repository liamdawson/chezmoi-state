#!/usr/bin/env bash

set -Eeuo pipefail

target_node_versions=(
  18.2.0  # current in node-build
  16.15.1 # lts
)
global_node_version="${target_node_versions[0]}"

for node_version in "${target_node_versions[@]}"; do
  (
    # work in a temp directory to avoid conflicting `.node-version` files
    #shellcheck disable=SC2064
    cd "$(mktemp -d)" && trap "rm -rf $(pwd)" EXIT

    node_packages=(
      typescript
    )

    nodenv install -s "$node_version"
    nodenv local "$node_version"

    corepack enable

    npm install -g "${node_packages[@]}"
    nodenv rehash || true

    # update pnpm version (due to versions that have failed under topgrade)
    pnpm add -g pnpm

    nodenv local --unset
  )
done

nodenv global "$global_node_version"
