function install_pure
    test (count $argv) -ge 1;
        and set FISH_CONFIG_DIR $argv[1];
        or set FISH_CONFIG_DIR "$HOME/.config/fish"

    test (count $argv) -ge 2;
        and set PURE_INSTALL_DIR $argv[2];
        or set PURE_INSTALL_DIR "$FISH_CONFIG_DIR/functions/theme-pure"

    # Check if 'git' is available
    command --search git >/dev/null 2>&1; or begin;
        printf "Error: git is not installed\n"
        exit 1
    end

    # Fetch source
    printf "Fetching theme's source\n"
    env git clone --depth=1 https://github.com/rafaelrinaldi/theme-pure.git $PURE_INSTALL_DIR; or begin;
        printf "Error: git clone of theme-pure repo failed\n"
        exit 1
    end

    # Install theme
    echo "Installing theme"

    #  Ignore previous theme
    set -l old_prompt $FISH_CONFIG_DIR/functions/fish_prompt.fish
    if test -f $old_prompt
        mv $old_prompt $old_prompt.ignore
        echo "Saved previous fish_prompt.fish to $old_prompt.ignore"
    end

    #  Enable autoloading for pure's functions on shell init
    set -l marker "# THEME PURE #"
    if not test (grep "$THEME_PURE" $FISH_CONFIG_DIR/config.fish 2>&1 >/dev/null)
        echo "$marker" >> $FISH_CONFIG_DIR/config.fish
        echo "set fish_function_path $PURE_INSTALL_DIR" '$fish_function_path' >> $FISH_CONFIG_DIR/config.fish
    end
    ln -sf $PURE_INSTALL_DIR/fish_prompt.fish $FISH_CONFIG_DIR/functions/

    # Enable theme
    printf "Enabling theme\n"
    set fish_function_path $PURE_INSTALL_DIR $fish_function_path
    source $FISH_CONFIG_DIR/functions/fish_prompt.fish
end