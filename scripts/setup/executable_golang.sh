#!/usr/bin/env bash

golang_packages=(
  golang.org/x/tools/cmd/godoc
)

go get "${golang_packages[@]}"
