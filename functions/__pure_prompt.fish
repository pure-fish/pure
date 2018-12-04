function __pure_prompt
    set --local virtualenv (__pure_virtualenv_prompt) # Python virtualenv name
    set --local vimode_indicator (__pure_vimode_prompt) # vi-mode indicator
    set --local pure_symbol (__pure_symbol_prompt $argv[1])

    echo (__pure_print_prompt $virtualenv $vimode_indicator $pure_symbol)
end
