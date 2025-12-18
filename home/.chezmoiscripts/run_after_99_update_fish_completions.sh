#!/usr/bin/env bash

completion_commands=(
  "asdf completion fish"
  "docker completion fish"
  "finch completion fish"
  "mise completion fish"
  "golangci-lint completion fish"
  "golangci-lint-v2 completion fish"
)

mkdir -p "${XDG_DATA_HOME}/fish/vendor_completions.d/"

for completion_command in "${completion_commands[@]}"; do
  base_command="${completion_command%% *}"

  if command -v "$base_command" >/dev/null 2>&1; then
    $completion_command > "${XDG_DATA_HOME}/fish/vendor_completions.d/${base_command}.fish"
  fi
done
