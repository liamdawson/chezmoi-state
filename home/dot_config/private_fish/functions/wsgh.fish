function wsgh --description "Open the GitHub repo URL for a workspace project"
    set -l parts (string split --max 1 '--' -- "$argv")
    set -l query $parts[1]

    ws "$query" -- gh repo view --web
end

complete -ec wsgh
complete -c wsgh -xa '(ghq list 2>/dev/null)'
