function wspd --description "Print the full path to a workspace folder"
    set -l parts (string split --max 1 '--' -- "$argv")
    set -l query $parts[1]

    ws "$query" -- pwd
end

complete -ec wspd
complete -c wspd -xa '(ghq list 2>/dev/null)'
