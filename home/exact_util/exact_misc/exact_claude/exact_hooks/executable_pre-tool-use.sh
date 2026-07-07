#!/usr/bin/env bash

set -euo pipefail

logdir="$HOME/.local/var/log/claude/"
mkdir -p "$logdir"

logfile="${logdir}/pre-tool-use.log"

relatively_safe_tools=(
  read
  toolsearch
)

main() {
  stdin="$(cat -)"

  tool_name_original="$(echo "$stdin" | jq -r '.tool_name')"
  tool_name="$(echo "$stdin" | jq -r '.tool_name | ascii_downcase')"
  tool_input="$(echo "$stdin" | jq -r '.tool_input')"

  {
    date "+%Y-%m-%dT%H:%M:%S%z"
    echo
    echo '`'"$tool_name"'`'
    echo '```'
    echo "$tool_input"
    echo '```'
    echo
    echo "**Script Arguments**"
    echo '```'
    printf '%s\n' "$@"
    echo '```'
    echo
    echo "**Standard Input**"
    echo '```json'
    echo "$stdin"
    echo '```'
    echo
    echo "Outcome:"
  } >>"$logfile"

  for tool in "${relatively_safe_tools[@]}"; do
    if [ "$tool_name" = "$tool" ]; then
      log "Permitted (in allowlist)"
      return
    fi
  done

  prompt_message="Claude is calling tool $tool_name_original with the following input:\n\n$(echo "$tool_input" | jq -r ".")\n\nPress esc to allow, or enter to deny."
  case "$tool_name" in
  bash)
    cmdline="$(echo "$tool_input" | jq -r ".command")"
    description="$(echo "$tool_input" | jq -r ".description")"

    prompt_message="bash:\n$description\n\n$cmdline"
    ;;
  esac

  if dialog -t "Claude PreToolUse Hook" --message "$prompt_message" --button1text "Allow" --button2text "Deny"; then
    log "Allowed by user input."
    return
  else
    statusout="$?"

    if [ "$statusout" -eq 2 ]; then
      log "Rejected by user input."

      {
        case "$tool_name" in
        "edit")
          echo "Blocked: rejected by the user - did they ask you to make this change?"
          ;;
        *)
          echo "Blocked: rejected by the user. Ask for next steps."
          ;;
        esac
      } >&2
      exit 2
    fi

    log "Unexpected dialog status: $statusout"
    echo "Blocked: unexpected error. Ask the user to investigate."
    exit 2
  fi
}

log() {
  echo "$@" >>"$logfile"
}

main "$@"
