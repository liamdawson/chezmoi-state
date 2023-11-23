#!/usr/bin/env bash

set -euo pipefail

fish <<EOSCRIPT
set -Ux HOMEBREW_CASK_OPTS --no-quarantine
EOSCRIPT
