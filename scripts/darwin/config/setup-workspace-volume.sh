#!/usr/bin/env bash

set -euo pipefail

target_disk="/dev/disk3"
apfs_personality="APFSX"
volume_name="src"
mountpoint="${HOME}/src"

mkdir -p "$mountpoint"

sudo diskutil apfs addVolume \
    "$target_disk" \
    "$apfs_personality" \
    "$volume_name" \
    -mountpoint "$mountpoint"

sudo chown "$(id -un):$(id -gn)" "$mountpoint"
sudo chmod "0700" "$mountpoint"
volume_uuid="$(diskutil info "$mountpoint" | grep -ie 'volume uuid' | awk -F ':' '{ gsub(/[ \t]+/, "", $2); print $2; }')"

echo "UUID=${volume_uuid} ${mountpoint} apfs rw" | sudo tee -a /etc/fstab
