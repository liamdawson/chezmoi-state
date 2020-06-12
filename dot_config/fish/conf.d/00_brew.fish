if not type -q brew
  set -l possible_paths /home/linuxbrew/.linuxbrew/bin "$HOME/.linuxbrew/bin"

  for bin_dir in $possible_paths
    if test -x "$bin_dir/brew"
      set -gx PATH $PATH $bin_dir
      break
    end
  end
end

if type -q brew
  brew shellenv | source
end
