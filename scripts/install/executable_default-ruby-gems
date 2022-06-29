#!/usr/bin/env bash

# hacky way to execute install_default_gems

after_install() {
  true
}

rbenv-exec() {
  eval "$@"
}

export STATUS="0"
source "$(brew --prefix rbenv-default-gems)/etc/rbenv.d/install/default-gems.bash"

install_default_gems
