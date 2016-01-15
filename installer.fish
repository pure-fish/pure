#!/usr/bin/env fish

function install
    set -l fish_function_path (echo $HOME/.config/fish/functions) $fish_function_path
    check_git_is_present
    fetch_source
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

install