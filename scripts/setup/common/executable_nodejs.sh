#!/usr/bin/env bash

set -Eeuo pipefail

# first entry is the new global
target_node_versions=(
  18.3.0  # current
  16.15.1 # lts
)

for node_version in "${target_node_versions[@]}"; do
  (
    echo "=== NodeJS version: $node_version"
    # work in a temp directory to avoid conflicting `.node-version` files
    #shellcheck disable=SC2064
    cd "$(mktemp -d)" && trap "rm -rf $(pwd)" EXIT
    eval "$(nodenv init - bash)"

    node_packages=(
      typescript
    )

    nodenv install -s "$node_version"
    nodenv local "$node_version"
    nodenv rehash || true

    nodenv exec npm install -g "${node_packages[@]}"
    nodenv rehash || true

    nodenv local --unset
  )
done

nodenv global "${target_node_versions[0]}"
