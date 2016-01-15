#!/usr/bin/env fish

function install
    set -l fish_function_path (echo $HOME/.config/fish/functions) $fish_function_path
end

install