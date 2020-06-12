# Liam's Chezmoi State

Prerequisites: `brew`

## Bootstrap

```shell
mkdir -p ~/.config/chezmoi
curl --proto "=https" --tlsv1.2 -sSf "https://raw.githubusercontent.com/liamdawson/chezmoi-state/master/.config-template.toml" -o ~/.config/chezmoi/config.toml
curl --proto "=https" --tlsv1.2 -sSf "https://raw.githubusercontent.com/liamdawson/chezmoi-state/master/.bootstrap.sh" | bash
```
