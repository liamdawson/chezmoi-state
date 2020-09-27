if type -q conda
  conda "shell.fish" "hook" $argv | source
end
