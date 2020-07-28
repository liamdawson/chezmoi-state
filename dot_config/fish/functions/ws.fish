function ws
  set -l short_dest (ghq list 2>/dev/null | peco --on-cancel=error --select-1 --query "$argv"); or return 1
  set -l full_dest (ghq list --full-path --exact "$short_dest" 2>/dev/null)

  cd "$full_dest"
end
