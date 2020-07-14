function fish_user_key_bindings -d "Vi-style key bindings, plus some extra fancy functions"
  fish_vi_key_bindings

  for mode in default insert
    # alt-g = short git summary
    bind -M $mode \u00A9 'echo; git-state; echo; commandline -f repaint'
    # alt-l = fancy git log
    bind -M $mode \u00AC 'echo; git-logs; echo; commandline -f repaint;'
    bind -M $mode \c_ 'cd (ghq list -p 2>/dev/null | peco); and commandline -f repaint'
  end
end
