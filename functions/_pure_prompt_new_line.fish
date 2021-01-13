function _pure_prompt_new_line \
    --description "Do not add a line break to a brand new session" \
    --on-event fish_prompt

    set --local new_line
    if not _pure_is_single_line_prompt; and test "$_pure_fresh_session" = false
        set new_line "\n"
    end

    echo -e -n "$new_line"
end
