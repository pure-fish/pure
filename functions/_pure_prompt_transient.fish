function _pure_prompt_transient \
    --description 'Print simplified transient prompt for scrollback history' \
    --argument-names exit_code

    set --local pure_symbol (_pure_prompt_symbol $exit_code)
    
    echo (\
        _pure_print_prompt \
        $pure_symbol \
        )
end
