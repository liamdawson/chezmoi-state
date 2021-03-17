#!/usr/bin/env bash

set -Eeuo pipefail

default_python_version="3.9.1"
python_versions=(
  "$default_python_version"
)
python_packages=(
  pipenv
)

for version in "${python_versions[@]}"; do
  pyenv install -s "$version"
done

pyenv global "$default_python_version"
pip install "${python_packages[@]}"
pyenv rehash || true
