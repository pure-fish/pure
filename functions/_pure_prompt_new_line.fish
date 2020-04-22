function _pure_prompt_new_line \
    --description "Do not add a line break to a brand new session" \
    --on-event fish_prompt

    set --local new_line

    if begin
            test $pure_compact_mode = false; or test "$PWD" != "$HOME"
        end; and test $_pure_fresh_session = false
        # don't show new line if it's a fresh session
        # or if compact mode is enabled and pwd = ~

        set new_line "\n"
    end

    echo -e -n "$new_line"
end
