source $current_dirname/../functions/_pure_prompt_new_line.fish

@test "_pure_prompt_new_line: print prompt with newline for existing session" (
    set _pure_fresh_session false

    _pure_prompt_new_line | wc --lines
) -eq 1

@test "_pure_prompt_new_line: print prompt without newline for new session" (
    set _pure_fresh_session true
    
    _pure_prompt_new_line | wc --lines
) = 0