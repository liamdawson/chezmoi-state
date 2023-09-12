if type -q rtx
    rtx activate fish | source
else if type -q asdf
    source (brew --prefix asdf)"/libexec/asdf.fish"
end
