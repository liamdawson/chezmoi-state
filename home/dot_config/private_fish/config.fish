fish_config theme choose "Dracula Official"
fish_vi_key_bindings

set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path

if status is-interactive
    # Commands to run in interactive sessions can go here

    source ~/.iterm2_shell_integration.fish
end
