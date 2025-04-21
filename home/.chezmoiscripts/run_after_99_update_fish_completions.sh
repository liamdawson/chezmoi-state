#!/usr/bin/env bash

if command -v asdf >/dev/null 2>&1; then
  asdf completion fish >~/.config/fish/completions/asdf.fish
fi

if command -v mise >/dev/null 2>&1; then
  mise completion fish > ~/.config/fish/completions/mise.fish
fi
