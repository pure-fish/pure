source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_parse_directory.fish
@echo (_print_filename (status filename))


function before_all
    _purge_configs
    _disable_colors
    set --universal pure_shorten_prompt_current_directory_length 0
end

function after_all
    set --erase pure_shorten_prompt_current_directory_length
end

before_all
@test "_pure_parse_directory: returns current directory" (
    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = $PWD

@test '_pure_parse_directory: replaces $HOME by ~' (
    pushd $HOME

    _pure_parse_directory
    popd
) = '~'

@test '_pure_parse_directory: shortens directory in prompt' (
    string length (_pure_parse_directory 1)
) -lt (string length $PWD)

@test '_pure_parse_directory: shorten current directory' (
    set --universal pure_shorten_prompt_current_directory_length 2

    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = /tm/cu/directory

after_all
