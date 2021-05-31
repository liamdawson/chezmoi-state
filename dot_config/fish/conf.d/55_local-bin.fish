if not contains "$HOME/.local/bin" $PATH
  fish_add_path --prepend "$HOME/.local/bin"
end
