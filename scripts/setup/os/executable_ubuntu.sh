#!/usr/bin/env bash

set -Eeuo pipefail

main() {
  gnome_ui_settings
  # configure_themes
  tilix_config
}

configure_themes() {
  ghq get dracula/tilix

  mkdir -p "${HOME}/.config/tilix/schemes"
  cp "$(ghq list --exact --full-path dracula/tilix)/Dracula.json" "${HOME}/.config/tilix/schemes/"
}

gnome_ui_settings() {
  # capslock => escape
  dconf write /org/gnome/desktop/input-sources/xkb-options "['terminate:ctrl_alt_bksp', 'caps:escape']"

  dconf write /org/gnome/desktop/interface/show-battery-percentage true
  # touchpad scroll direction
  dconf write /org/gnome/desktop/peripherals/touchpad/natural-scroll false
}

tilix_config() {
  cat <<EOF | dconf load /com/gexperts/Tilix/
[/]
copy-on-select=false
paste-strip-trailing-whitespace=true
terminal-title-show-when-single=false
terminal-title-style='small'
use-overlay-scrollbar=false
use-tabs=true

[profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d]
background-color='#282936'
badge-color-set=false
bold-color-set=false
cursor-colors-set=false
font='Cascadia Code 12'
foreground-color='#F8F8F2'
highlight-colors-set=false
palette=['#000000', '#FF5454', '#50FA7B', '#F1FA8C', '#BD93F9', '#FF79C6', '#8BE8FD', '#BFBFBF', '#4D4D4D', '#FF6E67', '#5AF78D', '#F4F99D', '#CAA8FA', '#FF92D0', '#9AEDFE', '#E6E6E6']
use-system-font=false
use-theme-colors=false
visible-name='Default'
EOF

}

main

cat >/dev/null <<EOF
# Dracula Tilix colours

/com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/use-theme-colors
  false

/com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/background-color
  '#282936'
/com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/badge-color-set
  false
/com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/bold-color-set
  false
/com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/cursor-colors-set
  false
/com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/foreground-color
  '#F8F8F2'
/com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/highlight-colors-set
  false

/com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/palette
  ['#000000', '#FF5454', '#50FA7B', '#F1FA8C', '#BD93F9', '#FF79C6', '#8BE8FD', '#BFBFBF', '#4D4D4D', '#FF6E67', '#5AF78D', '#F4F99D', '#CAA8FA', '#FF92D0', '#9AEDFE', '#E6E6E6']
EOF
