if status --is-interactive
  if type -q aws-vault
    abbr --global --add avl "aws-vault login"
    abbr --global --add ave "aws-vault exec"
  end
end
