function _pure_prompt_virtualenv --description "Display virtualenv directory"
    if test -n "$VIRTUAL_ENV"
        set --local virtualenv (basename "$VIRTUAL_ENV")
        set --local virtualenv_color (_pure_set_color $pure_color_virtualenv)

        echo "$virtualenv_color$virtualenv"
    else if test -n "$CONDA_DEFAULT_ENV"
        set --local virtualenv (basename "$CONDA_DEFAULT_ENV")
        set --local virtualenv_color (_pure_set_color $pure_color_virtualenv)

        echo "$virtualenv_color$virtualenv"
    end
end
