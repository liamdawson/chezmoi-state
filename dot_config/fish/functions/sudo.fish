# https://web.archive.org/web/20230518132008/https://bsago.me/tech-notes/sudo-with-aliases-in-fish

function sudo -d "sudo wrapper that handles aliases"
    if functions -q -- $argv[1]
        set -l new_args (string join ' ' -- (string escape -- $argv))
        set argv fish -c "$new_args"
    end

    command sudo $argv
end
