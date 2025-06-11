function _pure_prompt_nixdevshell \
    --description "Indicate if a nix shell is activated"

    if set --query pure_enable_nixdevshell;
        and test "$pure_enable_nixdevshell" = true

        set --local shell_type (_pure_prompt_nixdevshell_type)

        if test -n "$shell_type"

            set --local prefix (_pure_set_color $pure_color_nixdevshell_prefix)$pure_symbol_nixdevshell_prefix
            set --local symbol (_pure_set_color $pure_color_nixdevshell_status)$shell_type

            echo "$prefix$symbol"
        end
    end
end
