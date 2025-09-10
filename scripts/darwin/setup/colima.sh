#!/usr/bin/env bash

set -euo pipefail

main() {
  colima start
  brew services start colima
}

main "$@"
