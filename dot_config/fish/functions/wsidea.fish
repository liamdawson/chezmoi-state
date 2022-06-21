if status --is-interactive
  function wsidea --description "Open a workspace folder in IntelliJ IDEA"
    set -l parts (string split --max 1 '--' -- "$argv")
    set -l query $parts[1]

    ws "$query" -- idea .
  end

  complete -ec wsidea
  complete -c wsidea -xa '(ghq list 2>/dev/null)'
end
