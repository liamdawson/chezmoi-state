#!/usr/bin/env bash

set -Eeuo pipefail

defaults import com.apple.symbolichotkeys "$( dirname "${BASH_SOURCE[0]}" )/com.apple.symbolichotkeys.plist"
