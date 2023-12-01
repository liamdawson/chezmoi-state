function wscode --description "Open a workspace folder using VS Code"
    set -l parts (string split --max 1 '--' -- "$argv")
    set -l query $parts[1]

    if type -q code
        ws "$query" -- code .
    else if type -q code-insiders
        ws "$query" -- code-insiders .
    else
        ws "$query" -- vim .
    end
end

complete -ec wscode
complete -c wscode -xa '(ghq list 2>/dev/null)'
