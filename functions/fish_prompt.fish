# a called to `_pure_prompt_new_line` is triggered by an event
function fish_prompt
    set --local exit_codes $pipestatus # save previous exit codes

    # Handle transient prompt (Fish 4.1.0+)
    # When --final-rendering is passed, show simplified prompt for scrollback
    if contains -- --final-rendering $argv
        set --local last_status $exit_codes[-1]

        echo -e -n (_pure_prompt_transient $last_status)
        echo -e -n (_pure_prompt_ending)
        return
    end

    _pure_print_prompt_rows # manage default vs. compact prompt
    _pure_place_iterm2_prompt_mark # place iTerm shell integration mark
    echo -e -n (_pure_prompt $exit_codes) # print prompt
    echo -e -n (_pure_prompt_ending) # reset colors and end prompt

    set _pure_fresh_session false
end
