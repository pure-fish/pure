function _pure_prompt_npmrc --description "Display npmrc profile"
    if set --query pure_enable_npmrc; and test "$pure_enable_npmrc" = true
        set --local npmrc ''
        set --local npmrc_color (_pure_set_color $pure_color_npmrc)
        if test -e "$HOME/.npmrc"
            set npmrc (readlink $HOME/.npmrc | cut -d '/' -f 5)
        end
        if test -n $npmrc
            echo "$pure_symbol_npmrc_prefix $npmrc_color$npmrc"
        end
    end
end
