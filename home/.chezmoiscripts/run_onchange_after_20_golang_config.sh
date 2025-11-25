#!/usr/bin/env bash

set -Eeufo pipefail

go env -w GOPATH="$HOME/src/go"
# conflicts with mise?
# go env -w GOBIN="$HOME/.local/bin"
