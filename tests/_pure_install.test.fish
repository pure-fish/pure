source (status dirname)/fixtures/constants.fish
@echo (_print_filename (status filename))

function before_all
    _purge_configs
    _disable_colors
end
before_all

function before_each
    functions --erase _pure_install
    mkdir -p $__fish_config_dir/conf.d
end

function after_all
    # uncomment pure_version line in conf.d/pure.fish for macos job
    mv $__fish_config_dir/conf.d/pure.fish{.bak,}
end

before_each
@test "init/_pure_install: handler is available" (
    source (status dirname)/../conf.d/_pure_init.fish
    functions --query _pure_install
) $status -eq $SUCCESS

before_each
@test "init/_pure_install: prints installed version" (
    touch $__fish_config_dir/conf.d/pure.fish
    sed -i.bak 's/^\(.*pure_version.*\)$/# \1/' $__fish_config_dir/conf.d/pure.fish # for macos job
    set --global pure_symbol_prompt "❯"
    set --global pure_symbol_reverse_prompt "❮"
    set --global pure_version 1.2.3 # current version
    _mock_response set_color $EMPTY
    
    source (status dirname)/../conf.d/_pure_init.fish
    
    _pure_install | strip_ansi
) = "Now using: ❯❮❯ pure 1.2.3"

after_all