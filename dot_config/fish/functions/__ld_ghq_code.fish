function __ld_ghq_code
  set -l target (ghq list 2>/dev/null | peco --on-cancel=error); or return 0

  code-insiders (ghq list --full-path --exact "$target" 2>/dev/null)
end
