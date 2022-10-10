#!/usr/bin/env bash

main() {
	install_apprise
}

install_apprise() {
	if ! command -v apprise >/dev/null 2>&1; then
		command -v pipx >/dev/null 2>&1 || { echo "** apprise requires pipx, skipping install **"; return; }

		pipx install apprise
	fi
}

main
