if status --is-interactive
  if type -q aws-vault
    abbr --global --add avl "aws-vault login"
    abbr --global --add ave "aws-vault exec"
    abbr --global --add dx "direnv exec ."
    abbr --global --add bx "bundle exec"
  end
end
