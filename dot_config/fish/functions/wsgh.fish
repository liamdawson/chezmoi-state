function wsgh
  ws "$argv"; or return 1

  gh repo view --web

  cd -
end
