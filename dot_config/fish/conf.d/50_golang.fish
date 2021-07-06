set -q GOPATH; or set -Ux GOPATH "$HOME/go"

contains "$GOPATH/bin" $PATH; or fish_add_path "$GOPATH/bin"
