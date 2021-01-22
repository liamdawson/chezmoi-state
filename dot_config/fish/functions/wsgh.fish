if type -q ws
  function wsgh
    ws "$argv"; or return 1

    gh repo view --web

    cd -
  end

  complete -ec wsgh
  complete -c wsgh -xa "(complete -C'ws $argv')"
end
