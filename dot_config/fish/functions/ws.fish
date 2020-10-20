function ws --description "Switch to a workspace folder"
  set -l parts (string split --max 1 '--' -- "$argv")
  set -l query $parts[1]

  set -l short_dest (ghq list 2>/dev/null | sk --select-1 --query "$query"); or return 1
  set -l full_dest (ghq list --full-path --exact "$short_dest" 2>/dev/null)

  cd "$full_dest"; or return 2

  if test (count $parts) -gt 1
    "$SHELL" -c $parts[2]
    set -l inner_status $status

    cd -

    return $inner_status
  end
end
