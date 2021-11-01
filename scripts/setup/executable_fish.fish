#!/usr/bin/env fish

function main
  configure_homebrew
  configure_golang
  configure_pyenv
  configure_rust
  configure_local_bin
  configure_android_sdk
end

function configure_android_sdk
  set -l possible_paths "$HOME/Library/Android/Sdk" "$HOME/Android/Sdk"

  for sdk_dir in $possible_paths
    if test -d "$sdk_dir"
      set -q ANDROID_HOME; or set -Ux ANDROID_HOME $sdk_dir

      break
    end
  end
end

function configure_homebrew
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

    fish_add_path --prepend "$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin"
  end
end

function configure_golang
  set -q GOPATH; or set -Ux GOPATH "$HOME/go"

  fish_add_path "$GOPATH/bin"
end

function configure_pyenv
  if ! type -q pyenv
    echo "*** pyenv not found, skipping pyenv configuration"
    return
  end

  set -q PYENV_ROOT; or set -Ux PYENV_ROOT "$HOME/.pyenv"
  fish_add_path --prepend "$PYENV_ROOT/shims" "$PYENV_ROOT/bin"
end

function configure_rust
  set -q CARGO_HOME; or set -Ux CARGO_HOME $HOME/.cargo

  fish_add_path "$CARGO_HOME/bin"
end

function configure_local_bin
  fish_add_path --prepend "$HOME/.local/bin"
end

main
