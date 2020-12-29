source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_virtualenv.fish
source $current_dirname/../functions/_pure_set_color.fish
@mesg (_print_filename $current_filename)


function teardown
    set --erase --global VIRTUAL_ENV
    set --erase --global CONDA_DEFAULT_ENV
end


@test "_pure_prompt_virtualenv: hide virtualenv prompt when not activated" (
    set --erase VIRTUAL_ENV

    _pure_prompt_virtualenv

) $status -eq $SUCCESS

@test "_pure_prompt_virtualenv: displays virtualenv directory prompt" (
    set VIRTUAL_ENV /home/test/fake/project/
    set --global pure_color_virtualenv $EMPTY

    _pure_prompt_virtualenv
) = 'project'

@test "_pure_prompt_virtualenv: hide Conda virtualenv prompt when not activated" (
    set --erase CONDA_DEFAULT_ENV

    _pure_prompt_virtualenv

) $status -eq $SUCCESS

@test "_pure_prompt_virtualenv: displays Conda virtualenv directory prompt" (
    set CONDA_DEFAULT_ENV /home/test/fake/project/
    set --global pure_color_virtualenv $EMPTY

    _pure_prompt_virtualenv
) = 'project'

