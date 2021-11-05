function add-path-android-sdk
  if not set -q ANDROID_HOME
    echo "ANDROID_HOME is not set - aborting"
    return false
  end

  set -gx fish_user_paths "$ANDROID_HOME/cmdline-tools/latest/bin/" "$ANDROID_HOME/platform-tools/" "$ANDROID_HOME/tools/" $fish_user_paths
end
