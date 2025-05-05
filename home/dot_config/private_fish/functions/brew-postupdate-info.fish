function brew-postupdate-info --description "Describe brew formula/casks listed after update"
    set -f parts (fish_clipboard_paste | string join " " | string replace "\n" "   " | string split --max=1 "==> New Casks")

    set -f formula (string trim -- (string split --right --max=1 "==> New Formulae" -- $parts[1])[-1])
    set -f formula (string split --no-empty -- " " $formula)

    set -f casks (string trim -- $parts[2])[-1]
    set -f casks (string split --no-empty -- " " $casks)
    set -f casks (string match --invert --regex -- '^font[-]' $casks)

    if test (count $formula) -gt 0
        echo
        echo =======
        echo Formula
        echo =======
        echo
        brew info --formula $formula
        echo
    end

    if test (count $casks) -gt 0
        echo
        echo =====
        echo Casks
        echo =====
        echo
        brew info --cask $casks
        echo
    end
end

complete -ec brew-postupdate-info
complete -c brew-postupdate-info --no-files
