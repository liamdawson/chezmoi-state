if type -q starship
  function fish_prompt
      switch "$fish_key_bindings"
          case fish_hybrid_key_bindings fish_vi_key_bindings
              set keymap "$fish_bind_mode"
          case '*'
              set keymap insert
      end
      set -l exit_code $status
      # Account for changes in variable name between v2.7 and v3.0
      set -l starship_duration "$CMD_DURATION$cmd_duration"
      "/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
  end
  
  # disable virtualenv prompt, it breaks starship
  set VIRTUAL_ENV_DISABLE_PROMPT 1
  
  function fish_mode_prompt; end
  export STARSHIP_SHELL="fish"
else
  function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    echo

    # User
    set_color $fish_color_user
    echo -n (whoami)
    set_color normal

    echo -n '@'

    # Host
    set_color $fish_color_host
    echo -n (prompt_hostname)
    set_color normal

    echo -n ':'

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    if not test $last_status -eq 0
        set_color $fish_color_error
        echo -n " [$last_status]"
        set_color normal
    end

    echo

    if [ (id -u) -eq 0 ]
        echo -n '%> '
    else
        echo -n '$> '
    end
  end
end
