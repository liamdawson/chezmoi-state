function brew-postupdate-info --description "Describe brew formula/casks listed after update"
    argparse --ignore-unknown c/cask -- $argv
    or return

    set -f filtered false
    set -f brew_args

    if test (count $argv) -gt 0
        set -f targets (string split --no-empty ' ' -- $argv)
    else
        set -f targets (fish_clipboard_paste | string split --no-empty ' ')
    end

    if set -q _flag_cask
        set -f brew_args --cask
        set -l prev_count (count $targets)
        set -f targets (string match --invert --regex -- '^font[-]' $targets)
        if test (count $targets) -ne "$prev_count"
            set -f filtered true
        end
    end

    brew info $brew_args $targets

    if test "$filtered" = true
        echo
        echo
        echo "(Filtered some input entries)"
    end
end

complete -ec brew-postupdate-info
complete -c brew-postupdate-info --no-files
complete -c brew-postupdate-info --short-option c --long-option cask -d "Treat arguments as casks"
