function _pure_prompt
    set --local virtualenv (_pure_prompt_virtualenv) # Python virtualenv name
    set --local vimode_indicator (_pure_prompt_vimode) # vi-mode indicator
    set --local pure_symbol (_pure_prompt_symbol $argv[1])

    echo (_pure_print_prompt $virtualenv $vimode_indicator $pure_symbol)
end
