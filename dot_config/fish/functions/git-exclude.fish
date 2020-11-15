function git-exclude
  set -l exclude_file_path (git rev-parse --show-toplevel)"/.git/info/exclude"; or return 1

  for arg in $argv
    echo $arg >> "$exclude_file_path"
  end
end
