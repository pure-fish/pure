source $DIRNAME/../functions/_pure_prompt_virtualenv.fish

test "hide virtualenv prompt when not activated"
    (
        set --erase VIRTUAL_ENV

        _pure_prompt_virtualenv

    ) $status -eq 0
end

test "displays virtualenv directory prompt"
    (
        set VIRTUAL_ENV /home/test/fake/project/
        set pure_color_virtualenv (set_color grey)

        _pure_prompt_virtualenv

    ) = (set_color grey)'project'
end
