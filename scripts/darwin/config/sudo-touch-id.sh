#!/usr/bin/env bash

set -euo pipefail

# original template base64, if needed for comparison:
# IyBzdWRvX2xvY2FsOiBsb2NhbCBjb25maWcgZmlsZSB3aGljaCBzdXJ2aXZlcyBzeXN0ZW0gdXBkYXRlIGFuZCBpcyBpbmNsdWRlZCBmb3Igc3VkbwojIHVuY29tbWVudCBmb2xsb3dpbmcgbGluZSB0byBlbmFibGUgVG91Y2ggSUQgZm9yIHN1ZG8KI2F1dGggICAgICAgc3VmZmljaWVudCAgICAgcGFtX3RpZC5zbwo=

sudo -v

echo "creating sudo_local from template as:"
sed -Ee '/pam_tid.so/s/^#//g' /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
