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

    cp (status dirname)/../conf.d/_pure_init.fish $__fish_config_dir/conf.d/
    cp (status dirname)/../conf.d/pure.fish $__fish_config_dir/conf.d/
    cp (status dirname)/../functions/* $__fish_config_dir/functions/
end

function after_all
    touch $__fish_config_dir/functions/fish_prompt.fish
end

before_each
@test "init/_pure_uninstall: handler is available" (
    source $__fish_config_dir/conf.d/_pure_init.fish
    functions --query _pure_uninstall
) $status -eq $SUCCESS

before_each
@test "init/_pure_uninstall: restore default 'fish_prompt'" (
    source $__fish_config_dir/conf.d/_pure_init.fish

    _pure_uninstall

    if status list-files functions/fish_prompt.fish > /dev/null # standalone binary Fish ≥4.1.2
        status get-file functions/fish_prompt.fish > /tmp/fish_prompt.fish
        diff -q /tmp/fish_prompt.fish $__fish_config_dir/functions/fish_prompt.fish
    else
        diff -q {$__fish_data_dir,$__fish_config_dir}/functions/fish_prompt.fish
    end
) $status -eq $SUCCESS

before_each
@test "init/_pure_uninstall: restore default 'fish_title'" (
    source $__fish_config_dir/conf.d/_pure_init.fish

    _pure_uninstall

    if status list-files functions/fish_title.fish > /dev/null # standalone binary Fish ≥4.1.2
        status get-file functions/fish_title.fish > /tmp/fish_title.fish
        diff -q /tmp/fish_title.fish $__fish_config_dir/functions/fish_title.fish
    else
        diff -q {$__fish_data_dir,$__fish_config_dir}/functions/fish_title.fish
    end

) $status -eq $SUCCESS

before_each
@test "init/_pure_uninstall: restore a working fish_prompt" (
    source $__fish_config_dir/conf.d/_pure_init.fish

    _pure_uninstall

    fish_prompt >/dev/null
) $status -eq $SUCCESS

before_each
@test "init/_pure_uninstall: remove pure-related files" (
    source $__fish_config_dir/conf.d/_pure_init.fish
    touch $__fish_config_dir/functions/_pure_foo
    touch $__fish_config_dir/conf.d/_pure_bar

    _pure_uninstall

    count $__fish_config_dir/{functions,conf.d}/_pure_*
) = $NONE

before_each
@test "init/_pure_uninstall: preserve user's fish_greeting if not pointing to pure" (
    source $__fish_config_dir/conf.d/_pure_init.fish
    # Create a symlink to a non-pure path
    set --local temp_dir (mktemp -d)
    touch $temp_dir/fish_greeting.fish
    ln -sf $temp_dir/fish_greeting.fish $__fish_config_dir/functions/fish_greeting.fish

    _pure_uninstall

    # Verify file still exists before cleanup
    test -e $__fish_config_dir/functions/fish_greeting.fish
    set --local exists_status $status

    # Cleanup
    rm -rf $temp_dir
    rm -f $__fish_config_dir/functions/fish_greeting.fish

    test $exists_status -eq $SUCCESS
) $status -eq $SUCCESS

before_each
@test "init/_pure_uninstall: preserve user's fish_greeting if not a pure symlink" (
    source $__fish_config_dir/conf.d/_pure_init.fish
    # Create user's own fish_greeting file (not a symlink)
    echo "function fish_greeting; end" > $__fish_config_dir/functions/fish_greeting.fish

    _pure_uninstall

    test -e $__fish_config_dir/functions/fish_greeting.fish
) $status -eq $SUCCESS

if not test -d /etc/nix # skip on NixOS
    before_each
    @test "init/_pure_uninstall: remove pure-related functions" (
    source $__fish_config_dir/conf.d/_pure_init.fish
    function _pure_foo; end

    _pure_uninstall

    functions --names --all | string match --all --entire '_pure' | count
) = $NONE
end

after_all
