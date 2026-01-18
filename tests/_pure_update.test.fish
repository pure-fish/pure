source (status dirname)/fixtures/constants.fish
@echo (_print_filename (status filename))

function before_all
    _purge_configs
    _disable_colors
end
before_all

function before_each
    functions --erase _pure_update
    mkdir -p $__fish_config_dir/conf.d
    cp (status dirname)/../conf.d/_pure_init.fish $__fish_config_dir/conf.d/
end

before_each
@test "init/_pure_update: handler is available" (
    source $__fish_config_dir/conf.d/_pure_init.fish

    functions --query _pure_update
) $status -eq $SUCCESS

before_each
@test "init/_pure_update: prints version update" (
    set --global pure_symbol_prompt "❯"
    set --global pure_symbol_reverse_prompt "❮"
    set --global pure_version 1.0.0 # current version
    source $__fish_config_dir/conf.d/_pure_init.fish
    _mock_response set_color $EMPTY

    # _pure_update reads the version from conf.d/pure.fish
    echo "set --global pure_version 2.0.0 # new version" > $__fish_config_dir/conf.d/pure.fish

    _pure_update | strip_ansi
) = "Updating: ❯❮❯ pure 1.0.0 → 2.0.0"

before_each
@test "init/_pure_update: `_pure_update` run when `_pure_init_update` event is emitted" (
    set --global pure_version 1.0.0 # current version
    source $__fish_config_dir/conf.d/_pure_init.fish
    echo "set --global pure_version 2.0.0 # new version" > $__fish_config_dir/conf.d/pure.fish

    emit _pure_init_update # due to this event, test output will display: Updating: ❯❮❯ pure 1.0.0 → 2.0.0
    echo $pure_version
) = '2.0.0'
