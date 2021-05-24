if type -q convox
  function convox-scan
    set -l cache_dir "$HOME/.local/share/convox-cache"
    mkdir -p $cache_dir
    pushd $cache_dir || exit 1

    # get racks
    echo "Getting racks..."

    convox racks | awk 'NR>1 { print $1; }' > racks

    printf "rack\\tapp\\n" > apps.tsv
    for rack in (cat racks)
      echo "Getting apps from $rack..."
      convox apps --rack="$rack" | awk "NR>1 { printf \"%s\\t%s\\n\", \"$rack\", \$1; }" >> apps.tsv
    end

    popd
  end
end
