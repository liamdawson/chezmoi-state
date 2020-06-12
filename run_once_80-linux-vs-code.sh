#!/usr/bin/env bash

set -Eeuo pipefail

target_install="code-insiders"

if ! [ -f /usr/share/keyrings/packages.microsoft.gpg ]; then
	curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
fi

if ! [ -f /etc/apt/sources.list.d/vscode.list ]; then
	sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	sudo apt-get install -y apt-transport-https
fi

if ! command -v "$target_install" >/dev/null 2>&1; then
	sudo apt-get update && sudo apt-get install -y "$target_install"
fi

# url: https://go.microsoft.com/fwlink/?LinkID=760868
# insiders: https://go.microsoft.com/fwlink/?LinkID=760865
# TODO: install VS code by whatever means make the most sense now
