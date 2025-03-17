#!/usr/bin/env bash

set -euo pipefail

# path to directory containing this script
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
# path to the root directory of the parent git repo
REPO_DIR="$(git rev-parse --show-toplevel)"

main() {
  if [[ "$#" -ne 2 ]]; then
    echo "usage: <name> <email address>"
    exit 1
  fi

  new_id_filename="$HOME/.config/git/ids/$(openssl rand 64 | sha1)"

  if test -e "$new_id_filename"; then
    echo "Randomly generated ID already exists? Buy a lotto ticket!"
    exit 2
  fi

  cat <<EOIDFILE >"$new_id_filename"
[user]
  name = "$1"
  email = "$2"
EOIDFILE

  echo "Wrote ${new_id_filename}"
  chezmoi add --encrypt "$new_id_filename"
}

main "$@"
