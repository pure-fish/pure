source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_parse_directory.fish
@echo (_print_filename (status filename))


function before_each
    _purge_configs
    _disable_colors
    set --universal pure_shorten_prompt_current_directory_length 0
    set --universal pure_truncate_prompt_current_directory_keeps 0
end

function after_each
    set --erase pure_shorten_prompt_current_directory_length
end

before_each
@test "_pure_parse_directory: returns current directory" (
    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = $PWD

before_each
@test '_pure_parse_directory: replaces $HOME by ~' (
    pushd $HOME

    _pure_parse_directory
    popd
) = '~'

before_each
@test '_pure_parse_directory: shortens directory in prompt' (
    string length (_pure_parse_directory 1)
) -lt (string length $PWD)

before_each
@test '_pure_parse_directory: shorten current directory' (
    set --universal pure_shorten_prompt_current_directory_length 2

    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = /tm/cu/directory
after_each

before_each
@test '_pure_parse_directory: truncate 1, keeps only last directory name from current directory path' (
    set --universal pure_truncate_prompt_current_directory_keeps 1

    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = directory

before_each
@test '_pure_parse_directory: truncate n last component from current directory path' (
    set --universal pure_truncate_prompt_current_directory_keeps 2

    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = current/directory

before_each
@test '_pure_parse_directory: truncate 0, keeps full current directory path' (
    set --universal pure_truncate_prompt_current_directory_keeps 0

    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = /tmp/current/directory


