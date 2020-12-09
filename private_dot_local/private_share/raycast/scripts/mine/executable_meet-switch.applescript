#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Switch to Google Meet
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName Chezmoi Scripts

# adapted from https://dance.computer.dance/posts/2019/07/finding-open-web-pages-with-alfred.html
# https://web.archive.org/web/20200617014510/https://dance.computer.dance/posts/2019/07/finding-open-web-pages-with-alfred.html

set windowIndex to 1
set service_url to "https://meet.google.com/"

tell application "Google Chrome"
    repeat with theWindow in windows
        set tabIndex to 1
        repeat with theTab in tabs of theWindow
            if service_url is in url of theTab then
                activate
                tell window windowIndex
                    set active tab index to tabIndex
                    set index to 1
                end tell
                tell application "System Events" to tell process "Google Chrome"
                    perform action "AXRaise" of window 1
                end tell
                return
            end
            set tabIndex to tabIndex + 1
        end repeat
        set windowIndex to windowIndex + 1
    end repeat

    open location service_url
    activate
end tell
