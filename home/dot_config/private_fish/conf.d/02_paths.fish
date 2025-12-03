# desired state:
#   ~/bin and ~/.local/bin (user bins) always first - see 49_user_paths.fish
#   homebrew bin dirs always last
#   everything else roughly equal in the middle

# "everything else"
fish_add_path --global --prepend \
    "$HOME/.docker/bin" \
    "$HOME/src/go/bin" \
    "$HOME/.cargo/bin" \
    "$PNPM_HOME" \
    "$HOME/.cache/.bun/bin" \
    "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# homebrew bin dirs
fish_add_path --global --append --move \
    /home/linuxbrew/.linuxbrew/bin \
    "$HOME/.linuxbrew/bin" \
    /opt/homebrew/bin

# user bins added later to avoid homebrew moving in front
