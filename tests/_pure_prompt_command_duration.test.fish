source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_format_time.fish
source (status dirname)/../functions/_pure_prompt_command_duration.fish
@echo (_print_filename (status filename))


function before_all
    _purge_configs
    _disable_colors
end
before_all


@test "_pure_prompt_command_duration: hide command duration when it's zero" (
    set CMD_DURATION $EMPTY

    _pure_prompt_command_duration
) = $EMPTY

@test "_pure_prompt_command_duration: displays command duration when non-zero" (
    set CMD_DURATION 6053 # in milliseconds
    set --universal pure_threshold_command_duration 5 # in seconds

    _pure_prompt_command_duration
) = 6s

@test "_pure_prompt_command_duration: displays command duration with ms when non-zero" (
    set CMD_DURATION 6053 # in milliseconds
    set --universal pure_threshold_command_duration 5 # in seconds
    set --universal pure_show_subsecond_command_duration true

    _pure_prompt_command_duration
) = '6.05s'
