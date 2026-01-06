source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_exit_status.fish
@echo (_print_filename (status filename))

function before_each
    _purge_configs
    _disable_colors

    set --universal pure_show_exit_status true
end

before_each
@test "_pure_prompt_exit_status: single zero status. no output" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $SUCCESS
    set --universal pure_color_exit_status red
    _pure_prompt_exit_status $statuses
) -z

before_each
@test "_pure_prompt_exit_status: single non-zero status. has output" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $FAILURE
    set --universal pure_color_exit_status red
    set --universal pure_symbol_exit_status_prefix '/' # unique prefix
    _pure_prompt_exit_status $statuses
) = (set_color red)"/$FAILURE"

before_each
@test "_pure_prompt_exit_status: pipeline with all zero statuses. no output" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $SUCCESS $SUCCESS $SUCCESS $SUCCESS
    set --universal pure_color_exit_status red
    _pure_prompt_exit_status $statuses
) -z

before_each
@test "_pure_prompt_exit_status: pipeline with non-zero statuses, last status is zero. no output" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $SUCCESS $FAILURE $SUCCESS $SUCCESS
    set --universal pure_color_exit_status red
    _pure_prompt_exit_status $statuses
) -z

before_each
@test "_pure_prompt_exit_status: pipeline with non-zero statuses, last status is non-zero. shows all statuses" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $SUCCESS $FAILURE $SUCCESS $FAILURE
    set --universal pure_color_exit_status red
    set --universal pure_symbol_exit_status_separator '|'
    set --universal pure_symbol_exit_status_prefix '/' # unique prefix
    _pure_prompt_exit_status $statuses
) = (set_color red)"/$SUCCESS|$FAILURE|$SUCCESS|$FAILURE"

before_each
@test "_pure_prompt_exit_status: single signal and conversion disabled. shows status as number" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses 139
    set --universal pure_color_exit_status red
    set --universal pure_symbol_exit_status_separator '|'
    set --universal pure_symbol_exit_status_prefix '/' # unique prefix
    set --universal pure_convert_exit_status_to_signal false
    _pure_prompt_exit_status $statuses
) = (set_color red)"/139"

before_each
@test "_pure_prompt_exit_status: pipeline with a mix of everything, conversion disabled, last status is a signal. shows all as numbers" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $SUCCESS $FAILURE 123 139 $FAILURE $SUCCESS 54 141 $FAILURE 137
    set --universal pure_color_exit_status red
    set --universal pure_symbol_exit_status_separator '|'
    set --universal pure_symbol_exit_status_prefix '/' # unique prefix
    set --universal pure_convert_exit_status_to_signal false
    _pure_prompt_exit_status $statuses
) = (set_color red)"/0|1|123|139|1|0|54|141|1|137"

before_each
@test "_pure_prompt_exit_status: pipeline with a mix of everything, conversion enabled, last status is a signal. shows mix of numbers and signal names" (
    _pure_unmock _pure_set_color # enable colors
    set --local statuses $SUCCESS $FAILURE 123 139 $FAILURE $SUCCESS 54 141 $FAILURE 137
    set --universal pure_color_exit_status red
    set --universal pure_symbol_exit_status_separator '|'
    set --universal pure_symbol_exit_status_prefix '/' # unique prefix
    set --universal pure_convert_exit_status_to_signal true
    _pure_prompt_exit_status $statuses
) = (set_color red)"/0|1|123|SIGSEGV|1|0|54|SIGPIPE|1|SIGKILL" # NOTE: AFAIK these three are the same across all OSes, so this test shouldn't fail

before_each
if test (command uname -s) != "Darwin" # non-macOS
    @test "_pure_prompt_exit_status: pipeline of the first 15 signals, conversion enabled. shows all as (non-macOS) signal names" (
        _pure_unmock _pure_set_color # enable colors
        set --local statuses (seq 129 143)
        set --universal pure_color_exit_status red
        set --universal pure_symbol_exit_status_separator '|'
        set --universal pure_symbol_exit_status_prefix '/' # unique prefix
        set --universal pure_convert_exit_status_to_signal true
        _pure_prompt_exit_status $statuses
    ) = (set_color red)"/SIGHUP|SIGINT|SIGQUIT|SIGILL|SIGTRAP|SIGABRT|SIGBUS|SIGFPE|SIGKILL|SIGUSR1|SIGSEGV|SIGUSR2|SIGPIPE|SIGALRM|SIGTERM"
end

before_each
if test (command uname -s) = "Darwin" # macOS
    @test "_pure_prompt_exit_status: pipeline of the first 15 signals, conversion enabled. shows all as (macOS-specific) signal names" (
        _pure_unmock _pure_set_color # enable colors
        set --local statuses (seq 129 143)
        set --universal pure_color_exit_status red
        set --universal pure_symbol_exit_status_separator '|'
        set --universal pure_symbol_exit_status_prefix '/' # unique prefix
        set --universal pure_convert_exit_status_to_signal true
        _pure_prompt_exit_status $statuses
    ) = (set_color red)"/SIGHUP|SIGINT|SIGQUIT|SIGILL|SIGTRAP|SIGABRT|SIGEMT|SIGFPE|SIGKILL|SIGBUS|SIGSEGV|SIGSYS|SIGPIPE|SIGALRM|SIGTERM"
end
