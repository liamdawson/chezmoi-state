function __ld_ghq_cd
  set -l target (ghq list 2>/dev/null | peco --on-cancel=error); or return 0

  cd (ghq list --full-path --exact "$target" 2>/dev/null)
end
