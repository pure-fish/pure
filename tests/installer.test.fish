source $DIRNAME/../installer.fish

test 'set $FISH_CONFIG_DIR to default value'
    "$HOME/.config/fish" = (
        pure::set_fish_config_path
        echo "$FISH_CONFIG_DIR"
    )
end

test "pass argument to set $FISH_CONFIG_DIR"
    "/custom/config/path" = (
        pure::set_fish_config_path "/custom/config/path"
        echo "$FISH_CONFIG_DIR"
    )
end

test 'set $PURE_INSTALL_DIR to default value'
    "$FISH_CONFIG_DIR/functions/theme-pure" = (
        pure::set_pure_install_path
        echo $PURE_INSTALL_DIR
    )
end

test "pass arguments to set $PURE_INSTALL_DIR"
    "/custom/theme/path" = (
        pure::set_pure_install_path "/custom/config/path" "/custom/theme/path"
        echo "$PURE_INSTALL_DIR"
    )
end
