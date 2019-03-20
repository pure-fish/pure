source $current_dirname/../functions/_pure_prompt_beginning.fish

@test "_pure_prompt_beginning: clear line before printing prompt" (
    _pure_prompt_beginning
) = '\r\033[K'
