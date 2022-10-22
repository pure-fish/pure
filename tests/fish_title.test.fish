source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/../functions/fish_title.fish
@echo (_print_filename (status filename))


function setup
    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

end; setup

@test "fish_title: contains current directory and previous command" (
    set --universal pure_symbol_title_bar_separator '-'
    fish_title 'last-command'
) = "/tmp/current/directory: last-command - fish"

@test "fish_title: contains current directory with an *empty* previous command" (
    fish_title ''
) = "/tmp/current/directory - fish"

@test "fish_title: contains current path without a previous command" (
    set --universal pure_symbol_title_bar_separator '-'
    fish_title
) = "/tmp/current/directory - fish"

@test "fish_title: contains shorten (1) current path" (
    set --universal pure_shorten_window_title_current_directory_length 1
    fish_title
) = "/t/c/directory - fish"

@test "fish_title: contains shorten (2) current path" (
    set --universal pure_shorten_window_title_current_directory_length 2
    fish_title
) = "/tm/cu/directory - fish"
