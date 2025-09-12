#!/usr/bin/env bash

set -euo pipefail

main() {
  if [ -f ~/.docker/config.json ]; then
    if ! grep -qe '"/opt/homebrew/lib/docker/cli-plugins"' ~/.docker/config.json; then
      cp ~/.docker/config.json ~/.docker/old.config.json 

      cat ~/.docker/old.config.json | jq '. + {cliPluginsExtraDirs: .cliPluginsExtraDirs + ["/opt/homebrew/lib/docker/cli-plugins"]}' > ~/.docker/config.json 
    fi
  else
    echo '{"cliPluginsExtraDirs": ["/opt/homebrew/lib/docker/cli-plugins"]}' > ~/.docker/config.json
  fi

  softwareupdate --install-rosetta --agree

  env COLIMA_HOME="${HOME}/.colima" colima start --template
  colima stop

  brew services start colima
}

main "$@"
