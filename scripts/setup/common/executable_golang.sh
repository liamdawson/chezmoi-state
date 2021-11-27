#!/usr/bin/env bash

set -Eeuo pipefail

golang_packages=(
  golang.org/x/tools/cmd/godoc
)

go get "${golang_packages[@]}"
