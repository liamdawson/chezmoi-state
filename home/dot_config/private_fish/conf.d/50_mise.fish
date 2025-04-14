if type -q mise && $LD_CHEZMOI_FEATURE_MISE
    if test -d "$HOME/.local/share/mise/shims"
        fish_add_path --global --move --prepend --path "$HOME/.local/share/mise/shims"
    end

    mise activate fish | source
end
