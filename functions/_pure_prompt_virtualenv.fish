function _pure_prompt_virtualenv --description "Display virtualenv directory"
    if test -n "$VIRTUAL_ENV"
        set --local virtualenv (basename "$VIRTUAL_ENV")
        set --local virtualenv_color (_pure_get_var pure_color_virtualenv $pure_color_mute)

        echo "$virtualenv_color$virtualenv"
    end
end
