#!/usr/bin/env bash

set -Eeufo pipefail

go env -w GOPATH="$HOME/src/go"
go env -u GOBIN
