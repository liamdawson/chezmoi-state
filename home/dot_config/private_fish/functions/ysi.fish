function ysi --description "Add or manage PKCS#11 SSH identity from Yubikey"
    set -f options (fish_opt -s h -l help)
    set options $options (fish_opt -s a -l add)
    set options $options (fish_opt -s r -l remove)

    set -f provider_path "/usr/lib/ssh-keychain.dylib"

    argparse --max-args=0 $options -- $argv
    or return

    if set -q _flag_help
        echo "usage: "(status current-function)" [options]

  -h|--help       Displays help about using this command.
  -a|--add        Add the PKCS#11 identity from the Yubikey to the SSH agent (default).
  -r|--remove     Remove the PKCS#11 identity from the Yubikey from the SSH agent.

If both --add and --remove are provided, the identity will be removed (ignoring failure), and then added."

        return
    end

    if not set -q _flag_add; and not set -q _flag_remove
        set -f _flag_add --add
    end

    if set -q _flag_remove
        echo "removing SSH identity from Yubikey..."

        ssh-add -e $provider_path
        set -l ssh_add_status $status

        set -q _flag_add
        or return $ssh_add_status
    end

    if set -q _flag_add
        echo "adding SSH identity from Yubikey..."

        ssh-add -s $provider_path
    end
end

complete -ec ysi
complete -c ysi --no-files
complete -c ysi -s h -l help -d 'Display help and exit'
complete -c ysi -s a -l add -d 'Add the identity'
complete -c ysi -s r -l remove -d 'Remove the identity'
