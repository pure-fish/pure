source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_new_line.fish
@mesg (_print_filename $current_filename)


@test "_pure_prompt_new_line: print prompt with newline for existing session" (
    set _pure_fresh_session false

    _pure_prompt_new_line | wc -l
) -eq $IS_PRESENT

@test "_pure_prompt_new_line: print prompt without newline for new session" (
    set _pure_fresh_session true

    _pure_prompt_new_line | wc -l
) = $NONE
