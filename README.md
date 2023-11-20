# Liam's Chezmoi State

Prerequisites: `brew`

## Bootstrap

### Macos

```shell
curl --proto "=https" --tlsv1.2 -sSf "https://raw.githubusercontent.com/liamdawson/chezmoi-state/main/setup-macos.sh" | bash

# after reboot
chezmoi init --apply https://github.com/liamdawson/chezmoi-state.git
```
