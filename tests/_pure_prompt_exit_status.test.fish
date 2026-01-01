source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_exit_status.fish
@echo (_print_filename (status filename))

function before_each
    _purge_configs
    _disable_colors

    set --universal pure_show_exit_status true
end

before_each
@test "_pure_prompt_exit_status: single zero status, no output" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $SUCCESS
    set --universal pure_color_exit_status red
    _pure_prompt_exit_status $statuses
) -z

before_each
@test "_pure_prompt_exit_status: single non-zero status" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $FAILURE
    set --universal pure_color_exit_status red
    _pure_prompt_exit_status $statuses
) = (set_color red)"$FAILURE"

before_each
@test "_pure_prompt_exit_status: pipeline with all zero statuses, no output" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $SUCCESS $SUCCESS $SUCCESS $SUCCESS
    set --universal pure_color_exit_status red
    _pure_prompt_exit_status $statuses
) -z

before_each
@test "_pure_prompt_exit_status: pipeline with non-zero statuses, last status is zero, no output" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $SUCCESS $FAILURE $SUCCESS $SUCCESS
    set --universal pure_color_exit_status red
    _pure_prompt_exit_status $statuses
) -z

before_each
@test "_pure_prompt_exit_status: pipeline with non-zero statuses, last status is non-zero" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $SUCCESS $FAILURE $SUCCESS $FAILURE
    set --universal pure_color_exit_status red
    set --universal pure_symbol_exit_status_separator '|'
    _pure_prompt_exit_status $statuses
) = (set_color red)"$SUCCESS|$FAILURE|$SUCCESS|$FAILURE"
