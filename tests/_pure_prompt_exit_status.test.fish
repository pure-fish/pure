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

before_each
@test "_pure_prompt_exit_status: single signal and conversion disabled" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses 139
    set --universal pure_color_exit_status red
    set --universal pure_symbol_exit_status_separator '|'
    set --universal pure_convert_exit_status_to_signal false
    _pure_prompt_exit_status $statuses
) = (set_color red)"139"

before_each
@test "_pure_prompt_exit_status: pipeline with a mix of everything, conversion disabled, last status is a signal" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $SUCCESS $FAILURE 123 139 $FAILURE $SUCCESS 54 141 $FAILURE 137
    set --universal pure_color_exit_status red
    set --universal pure_symbol_exit_status_separator '|'
    set --universal pure_convert_exit_status_to_signal false
    _pure_prompt_exit_status $statuses
) = (set_color red)"0|1|123|139|1|0|54|141|1|137"

before_each
@test "_pure_prompt_exit_status: pipeline with a mix of everything, conversion enabled, last status is a signal" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $SUCCESS $FAILURE 123 139 $FAILURE $SUCCESS 54 141 $FAILURE 137
    set --universal pure_color_exit_status red
    set --universal pure_symbol_exit_status_separator '|'
    set --universal pure_convert_exit_status_to_signal true
    _pure_prompt_exit_status $statuses
) = (set_color red)"0|1|123|SIGSEGV|1|0|54|SIGPIPE|1|SIGKILL"

before_each
@test "_pure_prompt_exit_status: pipeline of the first 15 signals, conversion enabled" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses (seq 129 143)
    set --universal pure_color_exit_status red
    set --universal pure_symbol_exit_status_separator '|'
    set --universal pure_convert_exit_status_to_signal true
    _pure_prompt_exit_status $statuses
) = (set_color red)(
    # NOTE: this is required for the test to pass when not running on Linux,
    # since different kernels can have different signal meanings
    set expected ""
    for code in (seq 129 143)
        if test -z "$expected"
            set expected (fish_status_to_signal $code)
        else
            set expected (string join "|" "$expected" (fish_status_to_signal $code))
        end
    end
    echo $expected
)
