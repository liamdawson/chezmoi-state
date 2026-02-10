#!/usr/bin/env bash

mkdir -p "${XDG_DATA_HOME}/fish/vendor_functions.d/"

if command -v try-rs >/dev/null 2>&1; then
  try-rs --setup-stdout fish >"${XDG_DATA_HOME}/fish/vendor_functions.d/try-rs.fish"
fi
