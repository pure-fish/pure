function fish_prompt
    set --local exit_code $status  # save previous exit code

    echo -e -n (_pure_prompt_beginning)  # init prompt context (clear current line, etc.)

    # print current path, git branch/status, command duration
    if set --query pure_enable_compact_prompt; and test $pure_enable_compact_prompt = true
        echo -e -n (_pure_prompt_first_line)
    else
        echo -e (_pure_prompt_first_line)
    end

    _pure_place_iterm2_prompt_mark # place iTerm shell integration mark
    echo -e -n (_pure_prompt $exit_code)  # print prompt
    echo -e (_pure_prompt_ending)  # reset colors and end prompt

    set _pure_fresh_session false
end
