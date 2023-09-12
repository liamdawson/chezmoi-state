#!/usr/bin/env bash

set -Eeuo pipefail

if ! command -v rtx >/dev/null 2>&1; then
	echo "expected rtx to be installed"
	exit 1
fi

if [ -d "/Library/Java/JavaVirtualMachines" ]; then
	for version in $(rtx ls --installed --plugin java | awk '{ print $2; }'); do
		echo "== Linking ${version}"

		(
			set -x
			sudo mkdir -p "/Library/Java/JavaVirtualMachines/${version}.jdk"
			sudo ln -s "$(rtx where "java@${version}")/Contents" "/Library/Java/JavaVirtualMachines/${version}.jdk/Contents"
		)

		echo
	done
fi
