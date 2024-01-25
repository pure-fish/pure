function _pure_prompt_nixdevshell \
    --description "Indicate if nix develop shell is activated"

    if set --query pure_enable_nixdevshell;
        and test "$pure_enable_nixdevshell" = true;
        and test -n "$IN_NIX_SHELL"

        set --local prefix (_pure_set_color $pure_color_nixdevshell_prefix)$pure_symbol_nixdevshell_prefix
        set --local symbol (_pure_set_color $pure_color_nixdevshell_status)$IN_NIX_SHELL

        echo "$prefix$symbol"
    end
end
