# Liam's Chezmoi State

Prerequisites: `brew`

## Bootstrap

### Macos

```shell
curl --proto "=https" --tlsv1.2 -sSf "https://raw.githubusercontent.com/liamdawson/chezmoi-state/main/setup-macos.sh" | bash

# after reboot
chezmoi init --apply https://github.com/liamdawson/chezmoi-state.git
~/.local/share/chezmoi/scripts/finish-setup.sh
~/.local/share/chezmoi/scripts/darwin/sudo-touch-id.sh
```

#### Apps to Setup

- [ ] Velja
- [ ] Raycast
- [ ] Docker
- [ ] Elgato software (if applicable)
- [ ] Bartender
- [ ] Shottr
- [ ] Rectangle Pro
- [ ] Jetbrains Toolbox
