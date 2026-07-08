# `ghq list` spends a lot of time looking in unmanaged directories inside ~/src.
# This is a cheap and cheerful way to accomplish the same thing.

function __ghq_projects
    set -f ghq_root (ghq root)
    set -f git_dirs (find "$ghq_root"/* -maxdepth 3 -type d -name .git)

    for dir in $git_dirs
        string replace -m1 "$ghq_root/" '' -- $dir | path dirname
    end
end
