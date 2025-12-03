# ~/bin and ~/.local/bin (user bins) always first
fish_add_path --global --prepend --move \
    "$HOME/.local/bin" \
    "$HOME/bin"
