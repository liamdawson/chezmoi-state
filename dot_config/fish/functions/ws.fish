if status --is-interactive
    function ws --description "Run a command in, or switch to, a workspace folder"
        set -l parts (string split --max 1 '--' -- "$argv")
        set -l query $parts[1]

        set -l short_dest (ghq list 2>/dev/null | sk --select-1 --query "$query"); or return 1
        set -l full_dest (ghq list --full-path --exact "$short_dest" 2>/dev/null)

        if test (count $parts) -eq 1
            cd "$full_dest"; or return 2
        else
            pushd "$full_dest"; or return 2

            "$SHELL" -c $parts[2]
            set -l inner_status $status

            popd

            return $inner_status
        end
    end

    complete -ec ws
    complete -c ws -n 'not __fish_ws_is_commandline' -xa '(ghq list 2>/dev/null)'
    complete -c ws -n __fish_ws_is_commandline -xa '(__fish_ws_complete_commandline)'

    function __fish_ws_is_commandline
        string match -q -r '^--$' -- (commandline -opc)
    end

    function __fish_ws_complete_commandline
        set cmd_part (string replace --regex '^.*--\B' '' -- (commandline -pc))

        complete "-C$cmd_part"
    end
end
