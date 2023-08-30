source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/fish_title.fish
@echo (_print_filename (status filename))


function before_all
    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/
    set --universal pure_shorten_window_title_current_directory_length 0
end
before_all

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
