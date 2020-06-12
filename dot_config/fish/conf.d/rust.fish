set -l rustup_path $HOME/.cargo/bin

if set -q CARGO_HOME
  set rustup_path $CARGO_HOME/bin
end

set -g fish_user_paths $rustup_path $fish_user_paths
