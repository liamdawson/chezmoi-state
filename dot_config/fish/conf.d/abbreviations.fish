if status --is-interactive
  if type -q aws-vault
    abbr --global --add ave "aws-vault exec"
  end
  if type -q direnv
    abbr --global --add dx "direnv exec ."
  end
  if type -q bundle
    abbr --global --add bx "bundle exec"
  end
end
