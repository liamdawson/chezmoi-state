#!/usr/bin/env bash

set -euo pipefail

CERT_SERVICE_NAME="minio"
CERT_OUTPUT_DIR="/etc/step/certs"
CERT_COMMON_NAME="minio.ldaws.net"
CERT_SANS="galah.ldaws.net, minio.ldaws.net, minio.internal.ldaws.net, 192.168.2.1, a::b"
CERT_NOT_AFTER="24h"

main() {
    local sorted_san_list
    sorted_san_list="$(
        echo "${CERT_SANS:-}" |
            awk -F',' '{for(i=1; i<=NF; i++) { gsub(/^[ \t]+/, "", $i); print $i; } }' |
            sort --ignore-case --ignore-leading-blanks --ignore-nonprinting
    )"

    declare -a parsed_sans

    while IFS= read -r line; do
        parsed_sans+=("$line")
    done < <(echo "$sorted_san_list")

    local hash_id
    hash_id="$(calculate_hash_id)"

    echo "$hash_id"

    local cert_file="${CERT_OUTPUT_DIR}/${CERT_SERVICE_NAME}--${hash_id}.crt"
    local key_file="${CERT_OUTPUT_DIR}/${CERT_SERVICE_NAME}--${hash_id}.key"

    echo "$cert_file $key_file"

    if ! { test -e "$cert_file" && test -e "$key_file"; }; then
        echo "Certificate does not exist, creating"
        create_certificate "$cert_file" "$key_file"
    elif should_renew "$cert_file"; then
        echo "Certificate needs renewal"
        step ca renew --force "$cert_file" "$key_file"
    else
        echo "Certificate does not need renewal"
    fi
}

calculate_hash_id() {
    local cert_identifier_hash_part
    local cert_options_hash_part
    local cert_hash_value

    cert_identifier_hash_part="$(printf '%s|' "$CERT_COMMON_NAME" "${parsed_sans[@]}")"
    cert_options_hash_part="$(printf '%s|' "${CERT_NOT_AFTER:-}")"

    cert_hash_value="${cert_identifier_hash_part}##${cert_options_hash_part}"
    echo "$cert_hash_value" | shasum -a1 | cut -d' ' -f1 | head -c7
}

should_renew() {
    local cert_file="$1"

    step certificate needs-renewal "$cert_file"
}

should_create() {
    local cert_file="$1"
    local key_file="$2"

    if test -e "$key_file" && test -e "$cert_file"; then
        return 1
    fi

    return 0
}

main

# ; ExecCondition checks if the certificate is ready for renewal,
# ; based on the exit status of the command.
# ExecCondition=/usr/bin/env sh -c '! test -x "$EXEC_CONDITION_HOOK_PATH" || "$EXEC_CONDITION_HOOK_PATH"'
# ExecCondition=/usr/bin/env step certificate needs-renewal "${CERT_LOCATION}"

# ; ExecStart renews the certificate, if ExecStartPre was successful.
# ExecStart=/usr/bin/env step ca renew --force ${CERT_LOCATION} ${KEY_LOCATION}

# printf '%q:' "${parsed_sans[@]}"

# echo "$san_list"

# awk -F',' '{for(i=1; i<=NF; i++) { gsub(/^[ \t]+/, "", $i); print $i; } }'

# step ca certificate \
#   "{{ cygnus_minio_domain }}" \
#   "$CERT_LOCATION" \
#   "$KEY_LOCATION" \
#   --san="{{ box_hostname_fqdn }}" \
#   --san="{{ cygnus_minio_domain }}" \
#   --san={{ cygnus_minio_alternate_domains | join(' \\\n  --san=') }} \
#   --san={{ cygnus_minio_ipv4_addresses | join(' \\\n  --san=') }} \
#   --san={{ cygnus_minio_ipv6_addresses | join(' \\\n  --san=') }} \
#   --not-after=24h

# Environment=STEPPATH={{ ca_client_step_config_dir }} \
#             STEP_CA_URL={{ cygnus_ca_url }} \
#             STEP_ROOT={{ cygnus_ca_root_certificate_path }} \
#             STEP_PROVISIONER={{ cygnus_ca_host_provisioner.name }} \
#             STEP_PROVISIONER_PASSWORD_FILE={{ ca_client_provisioner_password_path }} \
#             CERT_LOCATION={{ (cygnus_ca_certs_dir, '%i.crt') | path_join }} \
#             KEY_LOCATION={{ (cygnus_ca_certs_dir, '%i.key') | path_join }} \
#             EXEC_CONDITION_HOOK_PATH={{ (cygnus_ca_client_hooks_dir, 'renew-condition--%i.sh') | path_join }} \
#             EXEC_POST_HOOK_PATH={{ (cygnus_ca_client_hooks_dir, 'renew-post--%i.sh') | path_join }}
