source $current_dirname/../tools/installer.fish

set --local succeed 0
set --local failed 1

function rm_pure_files
    for file in $HOME/.config/fish/functions/_pure*.fish
        rm --recursive --force "$file"
    end
    for file in $HOME/.config/fish/conf.d/*pure*
        rm --recursive --force "$file"
    end
    rm --recursive --force $HOME/.config/fish/functions/theme-pure
end

function rm_fish_prompt_files
    for file in $HOME/.config/fish/functions/fish_*.fish
        rm --recursive --force "$file"
    end
end

function setup
    touch $HOME/.config/fish/config.fish

    if test $USER = 'nemo'
        rm_pure_files
        rm_fish_prompt_files
        echo '' > $HOME/.config/fish/config.fish
    end
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
    function curl; echo $argv; end # mock
    pure_fetch_source >/dev/null

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


set --local is_present 1
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
        rm --force --recursive $FISH_CONFIG_DIR/{conf.d,functions}
        mkdir -p $FISH_CONFIG_DIR/{conf.d,functions}
        set PURE_INSTALL_DIR /tmp/.pure/

        pure_symlinks_assets >/dev/null

        set --local active_prompt $FISH_CONFIG_DIR/functions/fish_prompt.fish
        [ -r "$active_prompt" -a -L "$active_prompt" ]  # a readable symlink
    ) $status -eq $succeed
end







if test $USER = 'nemo'
    @test "installation methods: manually (with unpublished installer)" (
        source tools/installer.fish

        and install_pure >/dev/null
        source $PURE_INSTALL_DIR/conf.d/*

        fish -c 'fish_prompt | grep -c "❯"'
    ) = $succeed
end

# if test $USER = 'nemo'
#     @test "installation methods: manually (with published installer)" (
#         curl git.io/pure-fish --output /tmp/installer.fish --location --silent
#         and source /tmp/installer.fish
#         and install_pure

#         fish -c 'fish_prompt | grep -c "❯"'
#     ) = $succeed
# end

# if test $USER = 'nemo'
#     @test "installation methods: with fisher" (
#         fisher install rafaelrinaldi/pure >/dev/null

#         fish -c 'fish_prompt | grep -c "❯"'
#     ) = $succeed
# end

# if test $USER = 'nemo'
#     @test "installation methods: with OMF (Oh-My-Fish!)" (
#         rm --recursive --force $HOME/.local/share/omf $HOME/.config/omf/

#         curl -L https://get.oh-my.fish > install
#         and fish install --noninteractive >/dev/null

#         set --global OMF_PURE_PATH $HOME/.local/share/omf/themes/pure
#         fish -c "omf install pure; \
#                 ln -sf $OMF_PURE_PATH/functions/*.fish $HOME/.config/fish/functions/; \
#                 ln -sf $OMF_PURE_PATH/conf.d/* $HOME/.config/fish/conf.d/" > /dev/null
#         fish -c "fish_prompt" | grep -c '❯'
#     ) = $succeed
# end

# if test $USER = 'nemo'
#     @test "installation methods: with Fundle" (
#         rm --recursive --force $HOME/.config/fish/fundle/
#         mkdir -p $HOME/.config/fish/functions
#         curl https://git.io/fundle --output $HOME/.config/fish/functions/fundle.fish --location --silent >/dev/null

#         fundle plugin rafaelrinaldi/pure >/dev/null
#         fundle install >/dev/null
#         cp $HOME/.config/fish/fundle/rafaelrinaldi/pure/{,functions/}fish_prompt.fish

#         fish -c 'fish_prompt | grep -c "❯"'
#     ) = 1
# end
