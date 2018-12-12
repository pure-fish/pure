function _pure_prompt_symbol
    set --local pure_symbol $pure_symbol_prompt

    set --local color_symbol $pure_color_green # default pure symbol color
    if test $argv[1] -ne 0
        # Symbol color is red when previous command fails
        set color_symbol $pure_color_red

        if test $pure_separate_prompt_on_error -eq 1
            set color_symbol "$pure_color_red$pure_symbol_prompt$pure_color_green"
        end
    end

    echo "$color_symbol$pure_symbol"
end
