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