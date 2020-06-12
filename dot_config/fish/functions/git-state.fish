# https://github.com/joseluisq/gitnow/blob/ae2de93cfa863e370b84454210cc3618df5fab90/conf.d/gitnow.fish#L13-L18

function git-state -d "Show the working tree status in compact way"
  git status -sb
end
