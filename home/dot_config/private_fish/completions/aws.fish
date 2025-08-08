function __aws_complete
    set -lx COMP_SHELL fish
    set -lx COMP_LINE (commandline -pc)

    aws_completer
end

complete --command aws --no-files --arguments '(__aws_complete)'
