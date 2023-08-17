source (dirname (status filename))/fixtures/constants.fish
@echo (_print_filename (status filename))


function before_all
    _purge_configs
    _disable_colors
end
before_all


@test "init: _pure_fresh_session" (
    set --erase _pure_fresh_session
    source (dirname (status filename))/../conf.d/_pure_init.fish
    echo $_pure_fresh_session
) = true

@test "init: VIRTUAL_ENV_DISABLE_PROMPT" (
    set --erase VIRTUAL_ENV_DISABLE_PROMPT
    source (dirname (status filename))/../conf.d/_pure_init.fish
    echo $VIRTUAL_ENV_DISABLE_PROMPT
) = 1
