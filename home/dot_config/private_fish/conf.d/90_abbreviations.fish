abbr --add gfrboh -- "git fetch && git rebase origin/HEAD"
abbr --add gfrhh -- "git fetch && git reset --hard HEAD"
abbr --add gfrhoh -- "git fetch && git reset --hard origin/HEAD"
abbr --add grboh -- "git rebase origin/HEAD"
abbr --add grhh -- "git reset --hard HEAD"
abbr --add grhoh -- "git reset --hard origin/HEAD"

abbr --add gca -- "git commit --amend"

abbr --add gpf -- "git push --force-with-lease"
abbr --add gallc -- "git add (git rev-parse --show-toplevel) && git commit"
abbr --add --position anywhere gitroot -- "git rev-parse --show-toplevel"
