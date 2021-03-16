#!/usr/bin/env bash

set -Eeuo pipefail

default_ruby_version="2.7.2"
ruby_versions=(
  3.0.0
  2.7.2
  2.6.6
)

for version in "${ruby_versions[@]}"; do
  rbenv install -s "$version"
done

rbenv global "$default_ruby_version"
