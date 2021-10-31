#!/usr/bin/env bash

if ! [ -f "${HOME}/.sdkman/bin/sdkman-init.sh" ]; then
  curl -s "https://get.sdkman.io?rcupdate=false" | bash
fi

export SDKMAN_DIR="$HOME/.sdkman"
# shellcheck disable=SC1091
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

sdk install java 8.0.312-tem </dev/null
sdk install java 11.0.13-tem </dev/null
sdk install java 17.0.1-tem </dev/null

sdk default java 17.0.1-tem
