source $DIRNAME/../tools/installer.fish

test "pass argument to set $FISH_CONFIG_DIR"
    "/custom/config/path" = (
        pure::set_fish_config_path "/custom/config/path"
        echo "$FISH_CONFIG_DIR"
    )
end

test 'set $FISH_CONFIG_DIR to default value'
    "$HOME/.config/fish" = (
        pure::set_fish_config_path
        echo "$FISH_CONFIG_DIR"
    )
end

test "pass arguments to set $PURE_INSTALL_DIR"
    "/custom/theme/path" = (
        pure::set_pure_install_path "/custom/config/path" "/custom/theme/path"
        echo "$PURE_INSTALL_DIR"
    )
end

test 'set $PURE_INSTALL_DIR to default value'
    "$FISH_CONFIG_DIR/functions/theme-pure" = (
        pure::set_pure_install_path
        echo $PURE_INSTALL_DIR
    )
end

test "check git is present"
    ( pure::check_git_is_available >/dev/null) $status -eq 0
end

test "backup existing theme prompt"
    (
        set -l fake_prompt $FISH_CONFIG_DIR/functions/fish_prompt.fish
        touch "$fake_prompt"
        set -l backup_prompt $fake_prompt.ignore
        rm --force "$backup_prompt"

        pure::backup_existing_theme >/dev/null

        [ -e "$backup_prompt" ]
    ) $status -eq 0
end

test "inject autoloading in config"
    (
        pure::enable_autoloading >/dev/null
        grep -q 'fish_function_path' $HOME/.config/fish/config.fish
    ) $status -eq 0
end

test "activate prompt"
    (
        set -l active_prompt $FISH_CONFIG_DIR/functions/fish_prompt.fish
        rm --force "$active_prompt"
        mkdir -p $PURE_INSTALL_DIR; \
            and touch $PURE_INSTALL_DIR/fish_prompt.fish  # stub

        pure::enable_autoloading >/dev/null

        [ -r "$active_prompt" -a -L "$active_prompt" ]  # a readable symlink
    ) $status -eq 0
end

test "append path to theme's functions"
    (
        pure::enable_autoloading >/dev/null

        pure::enable_theme >/dev/null

        [ "$fish_function_path[1]" = "$PURE_INSTALL_DIR/functions/" ];
    ) $status -eq 0
end

test "load theme file"
    (
        echo 'set -g __pure_fresh_session 1' >$FISH_CONFIG_DIR/functions/fish_prompt.fish

        pure::enable_theme >/dev/null

        [ "$__pure_fresh_session" -eq 1 ]
    ) $status -eq 0
end
