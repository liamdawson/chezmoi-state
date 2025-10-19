#!/usr/bin/env bash

set -euo pipefail

export GOPATH="$HOME/src/go"

packages=(
  github.com/nao1215/gup@latest
  github.com/okzk/go-lambda-runner@latest
  golang.org/x/tools/cmd/godoc@latest
  golang.org/x/tools/cmd/goimports@latest
)

for package in "${packages[@]}"; do
  go install "$package"
done
