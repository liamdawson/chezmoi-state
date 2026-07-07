function sponge_custom_filter_expected_failures \
    --argument-names command exit_code previously_in_history

    if string match --regex --quiet 'exhaustruct$' -- $command
        # getting these errors due to https://github.com/GaijinEntertainment/go-exhaustruct/issues/166
        return (test $exit_code -eq 3)
    end

    return 1
end
