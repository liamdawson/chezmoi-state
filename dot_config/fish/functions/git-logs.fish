# https://github.com/joseluisq/gitnow/blob/ae2de93cfa863e370b84454210cc3618df5fab90/conf.d/gitnow.fish#L212-L224

function git-logs -d "Shows logs in a fancy way"
  set -l args HEAD

  if test -n "$argv"
    set args $argv
  end

  command git log $args --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit | command less -r

  commandline -f repaint;
end
