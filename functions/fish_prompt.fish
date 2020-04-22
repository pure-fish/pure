function fish_prompt
    set --local exit_code $status # save previous exit code

    echo -e -n (_pure_prompt_beginning) # init prompt context (clear current line, etc.)

    if test $pure_compact_mode = false; or test "$PWD" != "$HOME" #if compact mode is enabled and pwd = ~, don't show the first line
        echo -e (_pure_prompt_first_line) # print current path, git branch/status, command duration
    end

    _pure_place_iterm2_prompt_mark # place iTerm shell integration mark
    echo -e -n (_pure_prompt $exit_code) # print prompt
    echo -e (_pure_prompt_ending) # reset colors and end prompt

    set _pure_fresh_session false
end
