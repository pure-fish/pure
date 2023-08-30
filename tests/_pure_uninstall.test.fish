source (status dirname)/fixtures/constants.fish
@echo (_print_filename (status filename))


function before_all
    # _purge_configs # we need the context to uninstall
    _disable_colors
end
before_all

function before_each
    functions --erase _pure_uninstall
    mkdir -p $__fish_config_dir/{conf.d,functions}/

    cp (status dirname)/../conf.d/pure.fish $__fish_config_dir/conf.d/
    cp (status dirname)/../functions/* $__fish_config_dir/functions/
end

function after_all
    touch $__fish_config_dir/functions/fish_prompt.fish
end

before_each
@test "init/_pure_uninstall: handler is available" (
    source (status dirname)/../functions/_pure_set_default.fish
    source (status dirname)/../conf.d/_pure_init.fish
    functions --query _pure_uninstall
) $status -eq $SUCCESS

before_each
@test "init/_pure_uninstall: backup current 'fish_prompt'" (
    source (status dirname)/../conf.d/_pure_init.fish

    _pure_uninstall
) -e $__fish_config_dir/functions/fish_prompt.pure-backup.fish

before_each
@test "init/_pure_uninstall: restore default 'fish_prompt'" (
    source (status dirname)/../conf.d/_pure_init.fish

    _pure_uninstall

    diff -q {$__fish_data_dir,$__fish_config_dir}/functions/fish_title.fish
) $status -eq $SUCCESS

before_each
@test "init/_pure_uninstall: backup current 'fish_title'" (
    source (status dirname)/../conf.d/_pure_init.fish

    _pure_uninstall
) -e $__fish_config_dir/functions/fish_title.pure-backup.fish

before_each
@test "init/_pure_uninstall: restore default 'fish_title'" (
    source (status dirname)/../conf.d/_pure_init.fish

    _pure_uninstall

    diff -q {$__fish_data_dir,$__fish_config_dir}/functions/fish_title.fish
) $status -eq $SUCCESS

before_each
@test "init/_pure_uninstall: restore a working fish_prompt" (
    source (status dirname)/../conf.d/_pure_init.fish

    _pure_uninstall

    fish_prompt >/dev/null
) $status -eq $SUCCESS

before_each
@test "init/_pure_uninstall: remove pure-related files" (
    source (status dirname)/../conf.d/_pure_init.fish
    touch $__fish_config_dir/functions/_pure_foo
    touch $__fish_config_dir/conf.d/_pure_bar

    _pure_uninstall

    count $__fish_config_dir/{functions,conf.d}/_pure_*
) = $NONE

before_each
@test "init/_pure_uninstall: remove pure-related functions" (
    # source (status dirname)/../functions/_pure_set_default.fish
    source (status dirname)/../conf.d/_pure_init.fish
    function _pure_foo; end

    _pure_uninstall

    functions --names --all | string match --all --entire '_pure' | count
) = $NONE

after_all
