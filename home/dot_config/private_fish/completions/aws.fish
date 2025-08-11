function __aws_complete
    set -lx COMP_SHELL fish
    set -lx COMP_LINE (commandline -pcx) " "

    set -l incomplete_token (commandline -pt)
    set -l complete_tokens (commandline -pcx)

    if string match -q -- "-*" (commandline -pt)
        set COMP_LINE $COMP_LINE -
    end

    aws_completer
end

complete -ec aws
complete --command aws --no-files --arguments '(__aws_complete)'
