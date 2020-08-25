if not contains "$HOME/.local/bin" $fish_user_paths
  set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths
end
