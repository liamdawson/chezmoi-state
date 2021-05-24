if type -q convox
  function convoxfr --argument-names 'rack' --description "Match pattern used to find Convox rack"
    set -l cache_dir "$HOME/.local/share/convox-cache"
    pushd $cache_dir || return 1

    set -l matches (grep -e "$rack" racks)
    for rack in $matches
      echo "--rack=$rack"
    end

    popd

    if test (count $matches) -eq 0
      echo "No matches found."
      return 1
    end
  end

  function __fish_convoxfr_racks
    set -l cache_dir "$HOME/.local/share/convox-cache"

    cat "$cache_dir/racks"
  end

  complete -ec convoxfr
  complete -c convoxfr -xa "(__fish_convoxfr_racks)"
end
