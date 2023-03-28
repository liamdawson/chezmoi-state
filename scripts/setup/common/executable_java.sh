#!/usr/bin/env bash

set -Eeuo pipefail

java_versions=(
	"adoptopenjdk-17.0.6+10"
)

for version in "${java_versions[@]}"; do
	asdf install java "$version"
done
