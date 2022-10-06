source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/../functions/_pure_prompt_virtualenv.fish
@echo (_print_filename (status filename))


function before_all
    _disable_colors
end
before_all

function before_each
    set --erase --global VIRTUAL_ENV
    set --erase --global CONDA_DEFAULT_ENV
end


@test "_pure_prompt_virtualenv: hide virtualenv prompt when not activated" (
    before_each
    set --erase VIRTUAL_ENV

    _pure_prompt_virtualenv
) $status -eq $SUCCESS

@test "_pure_prompt_virtualenv: displays virtualenv directory prompt" (
    before_each
    set VIRTUAL_ENV /home/test/fake/project/

    _pure_prompt_virtualenv
) = project

@test "_pure_prompt_virtualenv: hides Conda virtualenv prompt when not activated" (
    before_each
    set --erase CONDA_DEFAULT_ENV

    _pure_prompt_virtualenv
) $status -eq $SUCCESS

@test "_pure_prompt_virtualenv: displays Conda virtualenv directory prompt" (
    before_each
    set CONDA_DEFAULT_ENV /home/test/fake/project/

    _pure_prompt_virtualenv
) = project
