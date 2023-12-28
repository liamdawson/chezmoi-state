# desired state: 
#   ~/bin and ~/.local/bin (user bins) always first
#   homebrew bin dirs always last
#   everything else roughly equal in the middle

# "everything else"
fish_add_path --prepend \
    "$HOME/.cargo/bin" \
    "$GOPATH/bin" \
    "$PNPM_HOME" \
    "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# homebrew bin dirs
fish_add_path --append --move \
    /home/linuxbrew/.linuxbrew/bin \
    "$HOME/.linuxbrew/bin" \
    /opt/homebrew/bin

# user bins
fish_add_path --prepend --move \
    "$HOME/.local/bin" \
    "$HOME/bin"
