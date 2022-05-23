source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_is_single_line_prompt.fish
source $current_dirname/../functions/_pure_prompt_new_line.fish
@mesg (_print_filename (status filename))


function setup
    _purge_configs
    _disable_colors
end


@test "_pure_prompt_new_line: print prompt with newline for existing session" (
    set _pure_fresh_session false

    _pure_prompt_new_line | wc -l
) -eq $IS_PRESENT

@test "_pure_prompt_new_line: print prompt without newline for new session" (
    set _pure_fresh_session true

    _pure_prompt_new_line | wc -l
) = $NONE

@test "_pure_prompt_new_line: print prompt without newline when single line prompt is enabled" (
    set _pure_fresh_session false
    set --universal pure_enable_single_line_prompt true

    _pure_prompt_new_line | wc -l
) = $NONE
