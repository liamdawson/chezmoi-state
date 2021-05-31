if not type -q brew
  set -l possible_paths /home/linuxbrew/.linuxbrew/bin "$HOME/.linuxbrew/bin"

  for bin_dir in $possible_paths
    if test -x "$bin_dir/brew"
      fish_add_path $bin_dir
      break
    end
  end
end

if type -q brew
  set -q HOMEBREW_PREFIX; or set -Ux HOMEBREW_PREFIX (brew --prefix)
  set -q HOMEBREW_CELLAR; or set -Ux HOMEBREW_CELLAR "$HOMEBREW_PREFIX/Cellar"
  set -q HOMEBREW_REPOSITORY; or set -Ux HOMEBREW_REPOSITORY "$HOMEBREW_PREFIX/Homebrew"
  set -q MANPATH; or set MANPATH ''; set -gx MANPATH "$HOMEBREW_PREFIX/share/man" $MANPATH;
  set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "$HOMEBREW_PREFIX/share/info" $INFOPATH;

  if not contains "$HOMEBREW_PREFIX/bin" $PATH
    fish_add_path --prepend "$HOMEBREW_PREFIX/bin"
  end

  if not contains "$HOMEBREW_PREFIX/sbin" $PATH
    fish_add_path --prepend "$HOMEBREW_PREFIX/sbin"
  end
end
