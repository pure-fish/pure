source $current_dirname/../functions/_pure_prompt_beginning.fish
@mesg (print_filename $current_filename)


@test "_pure_prompt_beginning: clear line before printing prompt" (
    _pure_prompt_beginning
) = '\r\033[K'
