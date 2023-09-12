#!/usr/bin/env bash

set -Ux RTX_ASDF_COMPAT 1

rtx plugin install ansible-base
rtx plugin install postgres
rtx plugin install terraform
rtx plugin install yarn
