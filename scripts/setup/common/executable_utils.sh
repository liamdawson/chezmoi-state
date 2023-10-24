#!/usr/bin/env bash

main() {
	# install_doing
	true
}

install_doing() {
	if ! command -v doing >/dev/null 2>&1; then
		brew gem install doing --homebrew-ruby
	fi
}

main
