source (dirname (status filename))/fixtures/constants.fish
@echo (_print_filename (status filename))


function setup
    _purge_configs
    _disable_colors
end; setup


@test "init/_pure_uninstall: handler is available"  (
    functions --erase _pure_uninstall
    source (dirname (status filename))/../conf.d/_pure_init.fish
    functions --query _pure_uninstall
) $status -eq $SUCCESS

@test "init/_pure_uninstall: restore default 'fish_prompt'"  (
    functions --erase _pure_uninstall
    source (dirname (status filename))/../conf.d/_pure_init.fish

    _pure_uninstall

    diff -q {$__fish_data_dir,$__fish_config_dir}/functions/fish_prompt.fish
) $status -eq $SUCCESS

@test "init/_pure_uninstall: restore a working fish_prompt"  (
    functions --erase _pure_uninstall
    source (dirname (status filename))/../conf.d/_pure_init.fish

    _pure_uninstall

    fish_prompt >/dev/null
) $status -eq $SUCCESS

@test "init/_pure_uninstall: remove pure-related files"  (
    functions --erase _pure_uninstall
    source (dirname (status filename))/../conf.d/_pure_init.fish
    touch $__fish_config_dir/functions/_pure_foo
    touch $__fish_config_dir/conf.d/_pure_bar

    _pure_uninstall

    count $__fish_config_dir/{functions,conf.d}/_pure_*
) = $NONE


@test "init/_pure_uninstall: remove pure-related files"  (
    functions --erase _pure_uninstall
    source (dirname (status filename))/../conf.d/_pure_init.fish
    function _pure_foo; end

    _pure_uninstall

    functions --names --all | string match --all --entire '_pure' | count 
) = $NONE