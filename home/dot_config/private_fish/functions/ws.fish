function ws --description "Run a command in, or switch to, a workspace folder"
    set -f query
    set -f command
    set -f processing_command_args false

    for arg in $argv
        if $processing_command_args
            set command $command $arg
        else if test "$arg" = --
            set processing_command_args true
        else
            set query $query $arg
        end
    end

    set -l short_dest (ghq list 2>/dev/null | sk --select-1 --query "$query"); or return 1
    set -l full_dest (ghq list --full-path --exact "$short_dest" 2>/dev/null)

    if test (count $command) -gt 0
        # command mode
        pushd "$full_dest"; or return 2

        echo (string escape -- $command) | "$SHELL"

        set -l inner_status $status

        popd

        return $inner_status
    else
        # cd mode
        cd "$full_dest"; or return 2
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
