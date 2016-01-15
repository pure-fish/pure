#!/usr/bin/env fish

function install
    set -l fish_function_path (echo $HOME/.config/fish/functions) $fish_function_path
    check_git_is_present
end

function check_git_is_present
    command --search git >/dev/null 2>&1; or begin;
        printf "Error: git is not installed\n"
        exit 1
    end
end

install