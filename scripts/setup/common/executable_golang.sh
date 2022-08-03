#!/usr/bin/env bash

set -Eeuo pipefail

golang_packages=(
  golang.org/x/tools/cmd/godoc@latest
  github.com/brancz/gojsontoyaml@latest
	github.com/mccutchen/go-httpbin/v2/cmd/go-httpbin@latest
)

for package in "${golang_packages[@]}"; do
  go install "$package"
done
