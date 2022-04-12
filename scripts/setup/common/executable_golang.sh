#!/usr/bin/env bash

set -Eeuo pipefail

golang_packages=(
  golang.org/x/tools/cmd/godoc@latest
  github.com/brancz/gojsontoyaml@latest
)

for package in "${golang_packages[@]}"; do
  go install "$package"
done
