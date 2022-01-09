#!/usr/bin/env bash

set -Eeuo pipefail

default_ruby_version="2.7.5"
ruby_versions=(
  3.1.0
  3.0.3
  2.7.5
  2.6.9
)

for version in "${ruby_versions[@]}"; do
  rbenv install -s "$version"
done

rbenv global "$default_ruby_version"
