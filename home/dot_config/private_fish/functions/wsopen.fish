function wsopen --description "Open the directory (in GUI) for a workspace project"
    set -l parts (string split --max 1 '--' -- "$argv")
    set -l query $parts[1]

    ws "$query" -- open .
end

complete -ec wsopen
complete -c wsopen -xa '(ghq list 2>/dev/null)'
