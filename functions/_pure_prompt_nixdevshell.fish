function _pure_prompt_nixdevshell \
    --description "Indicate if nix develop shell is activated"

    if set --query pure_enable_nixdevshell;
        and test "$pure_enable_nixdevshell" = true;
        and test -n "$IN_NIX_SHELL"

        set --local nixdevshell_color (_pure_set_color $pure_color_nixdevshell)

        echo "$pure_symbol_nixdevshell_prefix$nixdevshell_color$IN_NIX_SHELL"
    end
end
