function __pure_virtualenv_prompt
    if test -n "$VIRTUAL_ENV"
        set --local virtualenv (basename "$VIRTUAL_ENV")
        set --local virtualenv_color "$pure_color_gray"

        echo "$virtualenv_color$virtualenv"
    end
end
