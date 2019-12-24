source $current_dirname/../functions/_pure_prompt_virtualenv.fish
source $current_dirname/../functions/_pure_set_color.fish

@test "_pure_prompt_virtualenv: hide virtualenv prompt when not activated" (
    set --erase VIRTUAL_ENV

    _pure_prompt_virtualenv

) $status -eq 0

@test "_pure_prompt_virtualenv: displays virtualenv directory prompt" (
    set VIRTUAL_ENV /home/test/fake/project/
    set --global pure_color_virtualenv grey

    _pure_prompt_virtualenv
    set --erase --global VIRTUAL_ENV
) = (set_color grey)'project'
