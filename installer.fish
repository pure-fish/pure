set color_success (set_color green)
set color_error (set_color --bold red)
set color_white (set_color white)
set color_normal (set_color normal)

function pure::set_fish_config_path
    printf "\tSet environment variable: %s\n" "\$FISH_CONFIG_DIR"
    if test (count $argv) -ge 1
        set -gx FISH_CONFIG_DIR $argv[1]
    else
        set -gx FISH_CONFIG_DIR "$HOME/.config/fish"
    end
end

function pure::set_pure_install_path
    printf "\tSet environment variable: %s\n" "\$PURE_INSTALL_DIR"
    if test (count $argv) -ge 2
        set -gx PURE_INSTALL_DIR $argv[2]
    else
        set -gx PURE_INSTALL_DIR "$FISH_CONFIG_DIR/functions/theme-pure"
    end
end

function pure::check_git_is_available
    printf "\tChecking for git availability"
    command --search git >/dev/null 2>&1; or begin;
        printf "%sError: git is not installed%s" "$color_error" "$color_normal"
        return 1
    end
end

function pure::fetch_source
    printf "\tFetching theme's source"
    env git clone --depth=1 --quiet https://github.com/rafaelrinaldi/theme-pure.git $PURE_INSTALL_DIR; or begin;
        printf "%sError: git clone of theme-pure repo failed%s" "$color_error" "$color_normal"
        return 1
    end
end

function pure::backup_existing_theme
    printf "\tBackuping existing theme"
    set -l old_prompt $FISH_CONFIG_DIR/functions/fish_prompt.fish
    set -l backup_prompt $old_prompt.ignore
    if test -f "$old_prompt"
        mv "$old_prompt" "$backup_prompt"
        printf "\t\tPrevious config saved to: %s%s%s." "$color_white" "$backup_prompt" "$color_normal"
    end
end

function pure::enable_autoloading
    printf "\tEnabling autoloading for pure's functions on shell init"
    set -l marker "# THEME PURE #"
    touch "$FISH_CONFIG_DIR/config.fish"
    if not test (grep "$THEME_PURE" $FISH_CONFIG_DIR/config.fish 2>&1 >/dev/null)
        echo "$marker" >> $FISH_CONFIG_DIR/config.fish
        echo "set fish_function_path $PURE_INSTALL_DIR/functions/" '$fish_function_path' >> $FISH_CONFIG_DIR/config.fish
    end
    ln -sf $PURE_INSTALL_DIR/fish_prompt.fish $FISH_CONFIG_DIR/functions/
end

function pure::enable_theme
    printf "\tEnabling theme"
    set fish_function_path $PURE_INSTALL_DIR/functions/ $fish_function_path
    source $FISH_CONFIG_DIR/functions/fish_prompt.fish
end

function pure::clean_after_install
    printf "\tCleaning after install"
    functions --erase pure::set_fish_config_dir
    functions --erase pure::set_pure_install_dir
    functions --erase pure::check_git_is_available
    functions --erase pure::fetch_source
    functions --erase pure::backup_existing_theme
    functions --erase pure::enable_autoloading
    functions --erase pure::enable_theme
end

function pure::success
    echo $color_success "✔" $color_normal
end
function pure::error
    echo $color_error "✖" $color_normal
end

function pure::exit_symbol
    if test $argv[1] -eq 0
        pure::success
    else
        pure::error
    end
end

function install_pure
    printf "Installing Pure theme\n"
    pure::set_fish_config_path $argv
    pure::set_pure_install_path $argv
    pure::check_git_is_available; pure::exit_symbol $status
    pure::fetch_source; pure::exit_symbol $status
    pure::backup_existing_theme; pure::exit_symbol $status
    pure::enable_autoloading; pure::exit_symbol $status
    pure::enable_theme; pure::exit_symbol $status
    pure::clean_after_install; pure::exit_symbol $status
end
