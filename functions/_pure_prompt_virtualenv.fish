function _pure_prompt_virtualenv
    if test -n "$VIRTUAL_ENV"
        set --local virtualenv (basename "$VIRTUAL_ENV")
        set --local virtualenv_color "$pure_color_gray"

        echo "$virtualenv_color$virtualenv"
    end
end
