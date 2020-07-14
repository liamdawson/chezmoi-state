if not type -q brew
  set -l possible_paths /home/linuxbrew/.linuxbrew/bin "$HOME/.linuxbrew/bin"

  for bin_dir in $possible_paths
    if test -x "$bin_dir/brew"
      set -gx PATH $PATH $bin_dir
      break
    end
  end
end

# 2020-07-14 shellenv broken when used from non-fish parent processes (e.g. topgrade, VS Code, ...)
if type -q brew
  set -gx HOMEBREW_PREFIX (brew --prefix)
  set -gx HOMEBREW_CELLAR "$HOMEBREW_PREFIX/Cellar";
  set -gx HOMEBREW_REPOSITORY "$HOMEBREW_PREFIX/Homebrew";
  set -q PATH; or set PATH ''; set -gx PATH "$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin" $PATH;
  set -q MANPATH; or set MANPATH ''; set -gx MANPATH "$HOMEBREW_PREFIX/share/man" $MANPATH;
  set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "$HOMEBREW_PREFIX/share/info" $INFOPATH;
end
