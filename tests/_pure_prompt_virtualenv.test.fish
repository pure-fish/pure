source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_virtualenv.fish
@echo (_print_filename (status filename))


function before_each
    _purge_configs
    _disable_colors
    set --erase --global VIRTUAL_ENV
    set --erase --global CONDA_DEFAULT_ENV
end

before_each
@test "_pure_prompt_virtualenv: hide virtualenv prompt when not activated" (
    set --universal pure_enable_virtualenv false
    set --erase VIRTUAL_ENV

    _pure_prompt_virtualenv
) $status -eq $SUCCESS


before_each
@test "_pure_prompt_virtualenv: hide virtualenv prompt when env variable is absent" (
    set --universal pure_enable_virtualenv true
    set --erase VIRTUAL_ENV

    _pure_prompt_virtualenv
) $status -eq $SUCCESS

before_each
@test "_pure_prompt_virtualenv: displays virtualenv directory prompt" (
    set --universal pure_enable_virtualenv true
    set --universal pure_symbol_virtualenv_prefix $EMPTY
    set VIRTUAL_ENV /home/test/fake/project/

    _pure_prompt_virtualenv
) = project

before_each
@test "_pure_prompt_virtualenv: displays virtualenv symbol prefix" (
    set --universal pure_enable_virtualenv true
    set --universal pure_symbol_virtualenv_prefix "🐍"
    set VIRTUAL_ENV /home/test/fake/project/

    _pure_prompt_virtualenv
) = "🐍project"


before_each
@test "_pure_prompt_virtualenv: hides Conda virtualenv prompt when not activated" (
    set --universal pure_enable_virtualenv true
    set --universal pure_symbol_virtualenv_prefix $EMPTY
    set --erase CONDA_DEFAULT_ENV

    _pure_prompt_virtualenv
) $status -eq $SUCCESS

before_each
@test "_pure_prompt_virtualenv: displays Conda virtualenv directory prompt" (
    set --universal pure_enable_virtualenv true
    set --universal pure_symbol_virtualenv_prefix $EMPTY
    set CONDA_DEFAULT_ENV /home/test/fake/project/

    _pure_prompt_virtualenv
) = project

before_each
@test "_pure_prompt_virtualenv: displays virtualenv symbol prefix" (
    set --universal pure_enable_virtualenv true
    set --universal pure_symbol_virtualenv_prefix "🐍"
    set CONDA_DEFAULT_ENV /home/test/fake/project/

    _pure_prompt_virtualenv
) = "🐍project"
