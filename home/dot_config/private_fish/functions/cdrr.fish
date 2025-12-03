function cdrr -d "Change directory to the root of the current git repository"
  set -f dest (git rev-parse --show-toplevel); or return $status

  cd $dest
end
