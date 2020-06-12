function fish_user_key_bindings -d "Vi-style key bindings, plus some extra fancy functions"
  fish_vi_key_bindings

  for mode in default insert
    # alt-g = short git summary
    bind -M $mode \u00A9 'echo; git-state; echo; commandline -f repaint;'
  end
end
