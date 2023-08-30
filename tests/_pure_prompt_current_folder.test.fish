source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_current_folder.fish
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

@test "_pure_prompt_current_folder: fails if no argument given" (
    _pure_prompt_current_folder
) $status -eq $FAILURE

@test "_pure_prompt_current_folder: returns current folder" (
    set COLUMNS 20
    set current_prompt_width 10
    set pure_shorten_prompt_current_directory_length 0
    mkdir -p /tmp/.pure;
    and cd /tmp/.pure

    string length (_pure_prompt_current_folder "$current_prompt_width")
) = 8

after_all
