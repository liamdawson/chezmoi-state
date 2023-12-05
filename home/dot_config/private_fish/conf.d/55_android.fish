if test -d "$HOME/Library/Android/sdk"
    set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
end

if set -q ANDROID_HOME
    fish_add_path -g "$ANDROID_HOME/emulator" "$ANDROID_HOME/platform-tools"
end
