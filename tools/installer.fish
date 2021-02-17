set color_success (set_color green)
set color_error (set_color --bold red)
set color_white (set_color white)
set color_normal (set_color normal)

function pure_set_fish_config_path
    printf "\tSet environment variable: %s\n" "\$FISH_CONFIG_DIR"
    if test (count $argv) -ge 1
        set -gx FISH_CONFIG_DIR $argv[1]
    else
        set -gx FISH_CONFIG_DIR "$HOME/.config/fish"
    end
end

function pure_set_pure_install_path
    printf "\tSet environment variable: %s\n" "\$PURE_INSTALL_DIR"
    if test (count $argv) -ge 2
        set -gx PURE_INSTALL_DIR $argv[2]
    else
        set -gx PURE_INSTALL_DIR "$FISH_CONFIG_DIR/functions/theme-pure"
    end
end

function pure_scaffold_fish_directories
    printf "\tScaffolding fish directories"

    mkdir -p $FISH_CONFIG_DIR/functions/
    mkdir -p $FISH_CONFIG_DIR/conf.d/
end

function pure_fetch_source
    printf "\tFetching theme's source"

    set --local package "https://github.com/pure-fish/pure/archive/master.tar.gz"
    mkdir -p $PURE_INSTALL_DIR

    command curl --silent --show-error --location "$package" | command tar -xzf- -C $PURE_INSTALL_DIR --strip-components=1; or begin;
        printf "%sError: fetching Pure sources failed%s" "$color_error" "$color_normal"
        return 1
    end
end

function pure_backup_existing_theme
    printf "\tBackuping existing theme"
    set --local old_prompt $FISH_CONFIG_DIR/functions/fish_prompt.fish
    set --local backup_prompt $old_prompt.ignore

    if test -f "$old_prompt"
        mv "$old_prompt" "$backup_prompt"; pure_exit_symbol $status
        printf "\tPrevious config saved to: %s%s%s." "$color_white" "$backup_prompt" "$color_normal"
    end
end

function pure_enable_autoloading
    printf "\tEnabling autoloading for pure's functions on shell init"
    touch "$FISH_CONFIG_DIR/config.fish"
    if not grep -q "pure.fish" $FISH_CONFIG_DIR/config.fish
        echo "# THEME PURE #" >> $FISH_CONFIG_DIR/config.fish
        echo "set fish_function_path $PURE_INSTALL_DIR/functions/" '$fish_function_path' >> $FISH_CONFIG_DIR/config.fish
        echo "source $PURE_INSTALL_DIR/conf.d/pure.fish" >> $FISH_CONFIG_DIR/config.fish
    end
end

function pure_symlinks_assets
    printf "\tLink pure's configuration and functions to fish config directory"
    for pure_function in $PURE_INSTALL_DIR/functions/*.fish
        ln -sf $pure_function $FISH_CONFIG_DIR/functions/
    end
    for pure_config in $PURE_INSTALL_DIR/conf.d/*
        ln -sf $pure_config $FISH_CONFIG_DIR/conf.d/
    end
end

function pure_enable_theme
    printf "\tEnabling theme"
    set fish_function_path $PURE_INSTALL_DIR/functions/ $fish_function_path

    source $FISH_CONFIG_DIR/config.fish
end

function pure_clean_after_install
    printf "\tCleaning after install"
    functions --erase pure_set_fish_config_dir
    functions --erase pure_set_pure_install_dir
    functions --erase pure_fetch_source
    functions --erase pure_backup_existing_theme
    functions --erase pure_enable_autoloading
    functions --erase pure_symlinks_assets
    functions --erase pure_enable_theme
end

function pure_success
    echo $color_success "✔" $color_normal
end
function pure_error
    echo $color_error "✖" $color_normal
end

function pure_exit_symbol
    if test $argv[1] -eq 0
        pure_success
    else
        pure_error
    end
end

function install_pure
    printf "Installing Pure theme\n"
    pure_set_fish_config_path $argv
    pure_set_pure_install_path $argv
    pure_scaffold_fish_directories; pure_exit_symbol $status
    pure_fetch_source; pure_exit_symbol $status
    pure_backup_existing_theme; pure_exit_symbol $status
    pure_enable_autoloading; pure_exit_symbol $status
    pure_symlinks_assets; pure_exit_symbol $status
    pure_enable_theme; pure_exit_symbol $status
    pure_clean_after_install; pure_exit_symbol $status
end
