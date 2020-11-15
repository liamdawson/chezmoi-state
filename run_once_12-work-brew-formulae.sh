#!/usr/bin/env bash

set -Eeuo pipefail

## {{ if eq .data.work true }} Work-specific formulae
brew_formulae=(
  ansible
  aws/tap/aws-sam-cli
  buildkite/buildkite/buildkite-agent
  buildkite/cli/bk
  convox
  liamdawson/repo/buildkite_waiter
  plantuml

  ## Experiments
  aws-shell                           # More interactive AWS CLI activity
)

brew install "${brew_formulae[@]}"

# {{ end }}
