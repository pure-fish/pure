source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_format_time.fish
source $current_dirname/../functions/_pure_prompt_command_duration.fish
source $current_dirname/../functions/_pure_set_color.fish
@mesg (_print_filename $current_filename)


@test "_pure_prompt_command_duration: hide command duration when it's zero" (
    set CMD_DURATION $EMPTY
    set --global pure_color_command_duration $EMPTY

    _pure_prompt_command_duration
) = $EMPTY

@test "_pure_prompt_command_duration: displays command duration when non-zero" (
    set CMD_DURATION 6053 # in milliseconds
    set --global pure_threshold_command_duration 5 # in seconds
    set --global pure_color_command_duration $EMPTY

    _pure_prompt_command_duration
) = '6s'

@test "_pure_prompt_command_duration: displays command duration with ms when non-zero" (
    set CMD_DURATION 6053 # in milliseconds
    set --global pure_threshold_command_duration 5 # in seconds
    set --global pure_show_subsecond_command_duration true
    set --global pure_color_command_duration $empty

    _pure_prompt_command_duration
) = '6.05s'
