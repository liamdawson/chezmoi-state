# ASDF configuration code
if type -q asdf && $LD_CHEZMOI_FEATURE_ASDF
    if test -z $ASDF_DATA_DIR
        set _asdf_shims "$HOME/.asdf/shims"
    else
        set _asdf_shims "$ASDF_DATA_DIR/shims"
    end

    # asdf shims need to be at the front of PATH by default
    fish_add_path --prepend --move "$HOME/.asdf/shims"
    set --erase _asdf_shims
end
