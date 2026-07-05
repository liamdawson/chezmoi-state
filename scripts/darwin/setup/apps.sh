#!/usr/bin/env bash

apps=(
  "/Applications/Elgato Control Center.app"
  "/Applications/Elgato Stream Deck.app"
  "/Applications/JetBrains Toolbox.app"
  "/Applications/Raycast.app"
  "/Applications/Rectangle Pro.app"
  "/Applications/Shottr.app"
  "/Applications/Velja.app"
)

for app in "${apps[@]}"; do
  if test -f "$app"; then
    open "$app"
  fi
done
