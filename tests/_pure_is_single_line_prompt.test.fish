source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_is_single_line_prompt.fish
@mesg (_print_filename (status filename))


function setup
    _purge_configs
    _disable_colors
end

@test "_pure_is_single_line_prompt: fail when unset" (
    set --erase pure_enable_single_line_prompt

    _pure_is_single_line_prompt
) $status -eq $FAILURE

@test "_pure_is_single_line_prompt: fail when not disable" (
    set --universal pure_enable_single_line_prompt false

    _pure_is_single_line_prompt
) $status -eq $FAILURE

@test "_pure_is_single_line_prompt: succeed when enable" (
    set --universal pure_enable_single_line_prompt true

    _pure_is_single_line_prompt
) $status -eq $SUCCESS
