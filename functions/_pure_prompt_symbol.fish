function _pure_prompt_symbol \
    --description 'Print prompt symbol' \
    --argument-names exit_code

    set --local prompt_symbol (_pure_get_prompt_symbol)
    set --local symbol_color_success (_pure_get_var pure_color_prompt_on_success $pure_color_success)
    set --local symbol_color_error (_pure_get_var pure_color_prompt_on_error $pure_color_danger)
    set --local command_succeed 0

    set --local symbol_color $symbol_color_success # default pure symbol color
    if test $exit_code -ne $command_succeed
        set symbol_color $symbol_color_error # different pure symbol color when previous command failed

        if test "$pure_separate_prompt_on_error" = true
            set symbol_color "$symbol_color_error$prompt_symbol$symbol_color_success"
        end
    end

    echo "$symbol_color$prompt_symbol"
end
