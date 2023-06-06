if status --is-interactive
    complete -ec aws-vault

    # switch based on seeing a standalone `--` token
    complete -c aws-vault -n 'not __fish_aws_vault_is_commandline' -xa '(__fish_aws_vault_complete_arg)'
    complete -c aws-vault -n __fish_aws_vault_is_commandline -xa '(__fish_aws_vault_complete_commandline)'

    function __fish_aws_vault_is_commandline
        string match -q -r '^--$' -- (commandline -opc)
    end

    function __fish_aws_vault_complete_arg
        # take the input command line, tokenize it into a list, and drop the first element (should be "aws-vault")
        commandline -pc | read --local --tokenize --list parts
        set -e parts[1]

        aws-vault --completion-bash $parts
    end

    function __fish_aws_vault_complete_commandline
        set cmd_part (string replace --regex '^.*?--\B' '' -- (commandline -pc))

        complete "-C$cmd_part"
    end
end
