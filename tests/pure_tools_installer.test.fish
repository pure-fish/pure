source $current_dirname/../tools/installer.fish

set --local succeed 0

function setup
    touch $HOME/.config/fish/config.fish
end

function teardown
    rm $HOME/.config/fish/config.fish
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
    rm -rf $PURE_INSTALL_DIR/*
    function curl; echo $argv; end # mock
    pure_fetch_source >/dev/null

    test -e README.md
) $status -eq $succeed


@test "installer: backup existing theme prompt" (
    touch $FISH_CONFIG_DIR/functions/fish_prompt.fish
    rm -f $FISH_CONFIG_DIR/functions/fish_prompt.fish.ignore

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
    set --local active_prompt $FISH_CONFIG_DIR/functions/fish_prompt.fish
    rm -f "$active_prompt"
    mkdir -p $PURE_INSTALL_DIR; \
        and touch $PURE_INSTALL_DIR/fish_prompt.fish  # stub

    pure_enable_autoloading >/dev/null

    grep -c "pure.fish" $FISH_CONFIG_DIR/config.fish
) = 1

@test "installer: app path to theme's functions" (
    pure_enable_autoloading >/dev/null

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
        rm --force --recursive $FISH_CONFIG_DIR/{conf.d,functions}
        mkdir -p $FISH_CONFIG_DIR/{conf.d,functions}
        set PURE_INSTALL_DIR /tmp/.pure/

        pure_symlinks_assets >/dev/null

        set --local active_prompt $FISH_CONFIG_DIR/functions/fish_prompt.fish
        [ -r "$active_prompt" -a -L "$active_prompt" ]  # a readable symlink
    ) $status -eq $succeed
end
