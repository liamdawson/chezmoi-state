if not set -q CARGO_HOME
  set -Ux CARGO_HOME $HOME/.cargo
end

if not contains "$CARGO_HOME/bin" $PATH
  fish_add_path "$CARGO_HOME/bin"
end
