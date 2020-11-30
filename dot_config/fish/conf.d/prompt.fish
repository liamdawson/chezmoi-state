test -n "$TERM_PROGRAM"
and test $TERM_PROGRAM = iTerm.app
and test -e {$HOME}/.iterm2_shell_integration.fish
and source {$HOME}/.iterm2_shell_integration.fish

starship init fish | source
