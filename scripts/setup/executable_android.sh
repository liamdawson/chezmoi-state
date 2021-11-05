#!/usr/bin/env bash

set -Eeuo pipefail

if [ -z "${ANDROID_HOME:-}" ]; then
  echo "ANDROID_HOME is not set, exiting"
  exit
fi

ln -fs "${ANDROID_HOME}/platform-tools/adb" "${HOME}/.local/bin/adb"
ln -fs "${ANDROID_HOME}/platform-tools/fastboot" "${HOME}/.local/bin/fastboot"
