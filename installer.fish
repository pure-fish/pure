#!/usr/bin/env fish

function install
    check_git_is_present
    fetch_source
    enable_theme
end

function check_git_is_present
    command --search git >/dev/null 2>&1; or begin;
        printf "Error: git is not installed\n"
        exit 1
    end
end

function fetch_source
    printf "Fetching theme's source\n"
    env git clone --depth=1 https://github.com/rafaelrinaldi/theme-pure.git; or begin;
        printf "Error: git clone of theme-pure repo failed\n"
        exit 1
    end
end

function enable_theme
    printf "Enabling theme\n"
    set -l fish_function_path (echo $HOME/.config/fish/functions) $fish_function_path
    source theme-pure/__format_time.fish
    source theme-pure/__parse_current_folder.fish
    source theme-pure/__parse_git_branch.fish
    source theme-pure/fish_prompt.fish
    echo "pom"
end

install