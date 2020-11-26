source $current_dirname/../tools/installer.fish
source $current_dirname/../tools/versions-compare.fish

set --local succeed 0
set --local failed 1
set --local is_present 1

function remove_pure_files
    for file in $HOME/.config/fish/functions/_pure*.fish
        rm --recursive --force "$file"
    end
    for file in $HOME/.config/fish/conf.d/*pure*
        rm --recursive --force "$file"
    end
    rm --recursive --force $HOME/.config/fish/functions/theme-pure
end

function remove_fish_prompt_files
    for file in $HOME/.config/fish/functions/fish_*.fish
        rm --recursive --force "$file"
    end
end

function setup
    if test $USER = 'nemo'
        rm --force $HOME/.config/fish/config.fish
        touch $HOME/.config/fish/config.fish
        remove_pure_files
        remove_fish_prompt_files
        echo '' > $HOME/.config/fish/config.fish
    end
end

@test "installer: pass argument to set $FISH_CONFIG_DIR" (
    pure_set_fish_config_path "/custom/config/path" >/dev/null
    echo "$FISH_CONFIG_DIR"
) = "/custom/config/path"

@test 'installer: set $FISH_CONFIG_DIR to default value' (
    pure_set_fish_config_path >/dev/null
    echo "$FISH_CONFIG_DIR"
) = "$HOME/.config/fish"

@test "installer: pass arguments to set $PURE_INSTALL_DIR" (
    pure_set_pure_install_path "/custom/config/path" "/custom/theme/path" >/dev/null
    echo "$PURE_INSTALL_DIR"
) = "/custom/theme/path"

@test 'installer: set $PURE_INSTALL_DIR to default value' (
    pure_set_pure_install_path >/dev/null
    echo $PURE_INSTALL_DIR
) = "$FISH_CONFIG_DIR/functions/theme-pure"

@test "installer: pure_scaffold_fish_directories $FISH_CONFIG_DIR/{functions,conf.d}" (
    pure_scaffold_fish_directories >/dev/null

    test -d $FISH_CONFIG_DIR/functions -a -d $FISH_CONFIG_DIR/conf.d
) $status -eq $succeed

@test "installer: pure_fetch_source create install directory $PURE_INSTALL_DIR" (
    pure_fetch_source >/dev/null
    test -d $PURE_INSTALL_DIR -a -O $PURE_INSTALL_DIR
) $status -eq $succeed

@test "installer: pure_fetch_source extract source correctly" (
    function curl; echo $argv; end # mock
    pure_fetch_source >/dev/null
    functions --erase curl  # so others tests are not polluted

    test -e README.md
) $status -eq $succeed


@test "installer: backup existing theme prompt" (
    touch $FISH_CONFIG_DIR/functions/fish_prompt.fish
    rm --force $FISH_CONFIG_DIR/functions/fish_prompt.fish.ignore

    pure_backup_existing_theme >/dev/null
) -e "$FISH_CONFIG_DIR/functions/fish_prompt.fish.ignore"

@test "installer: inject autoloading in config" (
    set FISH_CONFIG_DIR "$HOME/.config/fish"
    mkdir -p $PURE_INSTALL_DIR/conf.d/
    touch $PURE_INSTALL_DIR/conf.d/pure.fish

    pure_enable_autoloading >/dev/null
    grep -q 'fish_function_path' $FISH_CONFIG_DIR/config.fish
) $status -eq $succeed


@test "installer: activate prompt" (
    pure_enable_autoloading >/dev/null

    grep -c "pure.fish" $FISH_CONFIG_DIR/config.fish
) = $is_present

@test "installer: app path to theme's functions" (
    touch $FISH_CONFIG_DIR/config.fish

    pure_enable_theme >/dev/null

    [ "$fish_function_path[1]" = "$PURE_INSTALL_DIR/functions/" ];
) $status -eq $succeed

@test "installer: load theme file" (
    echo 'set --global _pure_fresh_session true' > $FISH_CONFIG_DIR/config.fish

    pure_enable_theme >/dev/null

    [ "$_pure_fresh_session" = true ]
) $status -eq $succeed


if test $USER = 'nemo'
    @test "installer: link configuration and functions to fish config directory" (
        pure_set_pure_install_path "" /tmp/.pure/ >/dev/null
        pure_symlinks_assets >/dev/null

        set --local active_prompt $FISH_CONFIG_DIR/functions/fish_prompt.fish
        set --local pure_config $FISH_CONFIG_DIR/conf.d/pure.fish
        test \
            -r "$active_prompt" -a -L "$active_prompt" \
            -a -r "$pure_config" -a -L "$pure_config"   # configs and functions are a readable symlink
    ) $status -eq $succeed
end

if test $USER = 'nemo'
    @test "installation methods: manually (with local installer)" (
        source $current_dirname/../tools/installer.fish
        and install_pure >/dev/null
        for config in $PURE_INSTALL_DIR/conf.d/*
            source $config
        end

        set --global pure_symbol_prompt '>'  # using default ❯ break following tests
        fish -c 'fish_prompt | grep -c ">"'
    ) = $is_present
end

if test $USER = 'nemo'
    @test "installation methods: manually (with published installer)" (
        curl --silent --location git.io/pure-fish --output /tmp/installer.fish
        and source /tmp/installer.fish
        and install_pure >/dev/null

        set --global pure_symbol_prompt '>'  # using default ❯ break following tests
        fish -c 'fish_prompt | grep -c ">"'
    ) = $is_present
end

set --local fisher_version (fisher --version)
if is_fisher_4 $fisher_version and test $USER = 'nemo'
    @test "installation methods: with fisher 4.x" (
        fish -c 'fisher add rafaelrinaldi/pure' >/dev/null 2>&1

        set --global pure_symbol_prompt '>'  # using default ❯ break following tests
        fish -c 'fish_prompt | grep -c ">"'
    ) = $is_present
end

if not is_fisher_4 $fisher_version and test $USER = 'nemo'
    @test "installation methods: with fisher 3.x" (
        fish -c 'fisher add rafaelrinaldi/pure' >/dev/null 2>&1

        set --global pure_symbol_prompt '>'  # using default ❯ break following tests
        fish -c 'fish_prompt | grep -c ">"'
    ) = $is_present
end

if test $USER = 'nemo'
    @test "installation methods: with OMF (Oh-My-Fish!)" (
        rm --recursive --force $HOME/.local/share/omf $HOME/.config/omf/

        curl -L https://get.oh-my.fish > install
        and fish install --noninteractive >/dev/null

        set --global OMF_PURE_PATH $HOME/.local/share/omf/themes/pure
        fish -c "omf install pure; \
                ln -sf $OMF_PURE_PATH/functions/*.fish $HOME/.config/fish/functions/; \
                ln -sf $OMF_PURE_PATH/conf.d/* $HOME/.config/fish/conf.d/" > /dev/null
        set --global pure_symbol_prompt '>'  # using default ❯ break following tests
        fish -c "fish_prompt" | grep -c '>'
    ) = $is_present
end

if test $USER = 'nemo'
    @test "installation methods: with Fundle" (
        rm --recursive --force $HOME/.config/fish/fundle/
        mkdir -p $HOME/.config/fish/functions
        curl https://git.io/fundle --output $HOME/.config/fish/functions/fundle.fish --location --silent >/dev/null

        fundle plugin rafaelrinaldi/pure >/dev/null
        fundle install >/dev/null
        cp $HOME/.config/fish/fundle/rafaelrinaldi/pure/{,functions/}fish_prompt.fish

        set --global pure_symbol_prompt '>'  # using default ❯ break following tests
        fish -c "fish_prompt" | grep -c '>'
    ) = $is_present
end
