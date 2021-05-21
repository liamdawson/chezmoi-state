function prune-git-branches
  set -l default_branch (git branch -rl '*/HEAD' | rev | cut -d/ -f1 | rev)
  set -l merged_branches (git branch --merged | egrep -v "(^\*|$default_branch)")

  if test (count $merged_branches) -gt 0
    echo "Removing merged branches:"
    for raw_branch in $merged_branches
      set -l branch (string trim $raw_branch)
      git branch -d "$branch"
    end
  end
end
