function trial-tools
  comby -newline-separated -stdout -matcher .rb ':[~brew|cask] ":[formula]" :[~if] trial ":[purpose]"' ':[formula]|:[purpose]' ~/.Brewfile | column -t -s '|' | sort
end
