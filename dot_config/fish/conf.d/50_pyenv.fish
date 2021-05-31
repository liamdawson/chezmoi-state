if type -q pyenv
  set -q PYENV_ROOT; or set -Ux PYENV_ROOT "$HOME/.pyenv"
  fish_add_path "$PYENV_ROOT/shims" "$PYENV_ROOT/bin"
end
