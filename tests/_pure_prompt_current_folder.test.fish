source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_current_folder.fish
source $current_dirname/../functions/_pure_parse_directory.fish
source $current_dirname/../functions/_pure_set_color.fish


@test "_pure_prompt_current_folder: fails if no argument given" (
    _pure_prompt_current_folder
) $status -eq $FAILURE

@test "_pure_prompt_current_folder: returns current folder" (
    set --global pure_color_current_directory $EMPTY
    set COLUMNS 20
    set current_prompt_width 10
    mkdir -p /tmp/.pure;
    and cd /tmp/.pure

    string length (_pure_prompt_current_folder "$current_prompt_width")
) = 8
