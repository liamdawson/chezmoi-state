if type -q mise
    if test -d "$HOME/.local/share/mise/shims"
        fish_add_path --move --prepend --path "$HOME/.local/share/mise/shims"
    end

    mise activate fish | source
end
