#!/usr/bin/env bash

set -euo pipefail

# path to directory containing this script
SCRIPT_DIR="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"

main() {
  "${SCRIPT_DIR}/fish.sh"
  "${SCRIPT_DIR}/dock.sh"
}

main "$@"
