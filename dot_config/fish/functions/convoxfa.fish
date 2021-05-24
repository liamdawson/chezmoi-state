if type -q convox
  function convoxfa --argument-names 'app' --description "Match pattern used to find Convox app"
    set -l cache_dir "$HOME/.local/share/convox-cache"
    pushd $cache_dir || return 1

    set -l matches (grep -e "$app" apps.tsv)
    for match in $matches
      set -l rack (echo "$match" | cut -f 1)
      set -l app (echo "$match" | cut -f 2)
      echo "--rack=$rack --app=$app"
    end

    popd

    if test (count $matches) -eq 0
      echo "No matches found."
      return 1
    end
  end

  function __fish_convoxfa_apps
    set -l cache_dir "$HOME/.local/share/convox-cache"

    awk 'NR > 1 { print $2; }' < "$cache_dir/apps.tsv"
  end

  complete -ec convoxfa
  complete -c convoxfa -xa "(__fish_convoxfa_apps)"
end
