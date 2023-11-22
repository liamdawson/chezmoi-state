if not type -q brew
    set -l possible_paths /home/linuxbrew/.linuxbrew/bin "$HOME/.linuxbrew/bin" /opt/homebrew/bin

    for bin_dir in $possible_paths
        if test -x "$bin_dir/brew"
            fish_add_path $bin_dir
            break
        end
    end
end

if type -q brew
    brew shellenv fish | source
end
