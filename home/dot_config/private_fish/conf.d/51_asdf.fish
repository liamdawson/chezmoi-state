# ASDF configuration code
if command -v asdf >/dev/null 2>&1
    if test -z $ASDF_DATA_DIR
        set _asdf_shims "$HOME/.asdf/shims"
    else
        set _asdf_shims "$ASDF_DATA_DIR/shims"
    end

    # asdf shims need to be at the front of PATH by default
    fish_add_path --prepend --move "$HOME/.asdf/shims"
    set --erase _asdf_shims
end
