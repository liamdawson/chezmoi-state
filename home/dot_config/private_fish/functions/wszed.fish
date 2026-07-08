function wszed --description "Open a workspace folder using Zed"
    set -l parts (string split --max 1 '--' -- "$argv")
    set -l query $parts[1]

    ws "$query" -- zed .
end

complete -ec wszed
complete -c wszed -xa '(__ghq_projects)'
