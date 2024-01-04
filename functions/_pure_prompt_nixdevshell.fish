function _pure_prompt_nixdevshell \
    --description "Indicate if nix develop shell is activated"

    if set --query pure_enable_nixdevshell;
        and test "$pure_enable_nixdevshell" = true

        set --local nixdevshell ''
        set --local nixdevshell_color (_pure_set_color $pure_color_nixdevshell)
        if test -n "$IN_NIX_SHELL"
            set nixdevshell $IN_NIX_SHELL
        end

        if test -n $nixdevshell
            echo "$pure_symbol_nixdevshell_prefix$nixdevshell_color$nixdevshell"
        end
    end
end
