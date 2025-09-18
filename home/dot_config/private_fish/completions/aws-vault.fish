complete -ec aws-vault

complete -c aws-vault -xa '(__fish_aws_vault_complete_arg)'
complete -c aws-vault -n '__fish_seen_subcommand_from exec; and test (__fish_number_of_cmd_args_wo_opts) -gt 2' -xa '(__fish_complete_subcommand --fcs-skip=3)'

function __fish_aws_vault_complete_arg
    set -l parts (commandline -cx) (commandline -ct)
    set -e parts[1]

    aws-vault --completion-bash $parts
end
