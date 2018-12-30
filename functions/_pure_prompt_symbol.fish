function _pure_prompt_symbol \
    --description 'Print prompt symbol' \
    --argument-names exit_code

    set --local pure_symbol $pure_symbol_prompt
    set --local command_succeed 0

    set --local color_symbol $pure_color_green  # pure symbol is green by default
    if test $exit_code -ne 0
        set color_symbol $pure_color_red  # pure symbol is red when previous command failed

        if test $pure_separate_prompt_on_error = true 
            set color_symbol "$pure_color_red$pure_symbol_prompt$pure_color_magenta"
        end
    end

    echo "$color_symbol$pure_symbol"
end
