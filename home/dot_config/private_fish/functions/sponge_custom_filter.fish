function sponge_custom_filter \
    --argument-names command exit_code previously_in_history

    # keep in history if sponge_filter_failed allows it
    sponge_filter_failed "$command" "$exit_code" "$previously_in_history"
    if test $status = 1
        return 1
    end

    # discard if sponge_filter_matched says to
    sponge_filter_matched "$command" "$exit_code" "$previously_in_history"
    if test $status = 0
        return
    end

    #
    # evaluate custom logic beyond this point
    #

    set -f command_parts (commandline -I "$command" -x)
    set -f command_name $command_parts[1]

    if string match --regex --quiet '[/]?exhaustruct$' -- $command_name
        # getting these errors due to https://github.com/GaijinEntertainment/go-exhaustruct/issues/166
        if test $exit_code -eq 3
            return 1
        end
    else if string match --regex --quiet '[/]?go$' -- $command_name && test $command_parts[2] = test
        # don't scrub `go test` due to test failures
        if test $exit_code -eq 1
            return 1
        end
    end
end
