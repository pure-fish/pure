function _pure_prompt_symbol \
    --description 'Print prompt symbol' \
    --argument-names exit_code

    set --local prompt_symbol $pure_symbol_prompt # default pure symbol (`❯`)
    set --local is_vi_mode (string match fish_{vi,hybrid}_key_bindings $fish_key_bindings)
    if test is_vi_mode \
            -a $pure_reverse_prompt_symbol_in_vimode \
            -a "$fish_bind_mode" != "insert"
        set prompt_symbol $pure_symbol_reverse # default reverse symbol `❮`
    end

    set --local command_succeed 0
    set --local color_symbol $pure_color_prompt_on_success # default pure symbol color
    if test $exit_code -ne $command_succeed
        set color_symbol $pure_color_prompt_on_error  # different pure symbol color when previous command failed

        if test "$pure_separate_prompt_on_error" = true
            set color_symbol "$pure_color_symbol_error$prompt_symbol$pure_color_symbol_success"
        end
    end

    echo "$color_symbol$prompt_symbol"
end
