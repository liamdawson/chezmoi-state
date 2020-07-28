function wsc
  ws "$argv"; or return 1

  if type -q code-insiders
    code-insiders .
  else if type -q code
    code .
  else
    vim .
  end
end
