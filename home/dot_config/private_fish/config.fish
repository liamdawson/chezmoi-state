fish_config theme choose "Dracula Official"
fish_vi_key_bindings

set fish_function_path $fish_function_path[1] ~/.config/fish/functions/private $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] ~/.config/fish/completions/private $fish_complete_path[2..-1]

if status is-interactive
    # Commands to run in interactive sessions can go here

    source ~/.iterm2_shell_integration.fish
end
