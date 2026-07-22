function run-claude-in-sandbox
    nono run \
        --profile personal-claude-code \
        --allow-cwd \
        -- claude $argv
end

complete -c run-claude-in-sandbox -w claude
