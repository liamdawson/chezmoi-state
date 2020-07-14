function fish_user_key_bindings -d "Vi-style key bindings, plus some extra fancy functions"
  fish_vi_key_bindings

  for mode in default insert
    # alt-g = short git summary
    bind -M $mode \u00A9 'echo; git-state; echo; commandline -f repaint'
    # alt-l = fancy git log
    bind -M $mode \u00AC 'echo; git-logs; echo; commandline -f repaint;'
    bind -M $mode \c_ '_ld_ghq_cd; commandline -f repaint;'
  end
end
