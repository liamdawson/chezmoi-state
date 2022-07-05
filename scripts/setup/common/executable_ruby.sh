#!/usr/bin/env bash

set -Eeuo pipefail

default_ruby_version="2.7.6"
ruby_versions=(
  3.1.2
  3.0.4
  2.7.6
)

for version in "${ruby_versions[@]}"; do
  rbenv install -s "$version"
done

rbenv global "$default_ruby_version"
