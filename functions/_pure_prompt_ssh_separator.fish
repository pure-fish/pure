function _pure_prompt_ssh_separator
    set --local separator_symbol "@"
    set --local separator_symbol_color (_pure_get_var pure_color_ssh_separator $pure_color_mute)

    echo "$separator_symbol_color$separator_symbol"
end
