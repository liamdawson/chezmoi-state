set -q GOPATH; or set -Ux GOPATH "$HOME/go"
if not contains "$GOPATH/bin" $PATH
  fish_add_path "$GOPATH/bin"
end
# set -g fish_user_paths "$GOPATH/bin" $fish_user_paths
