source $current_dirname/../functions/_pure_prompt_ending.fish
@mesg (print_filename $current_filename)


@test "_pure_prompt_ending: reset color to normal" (
    _pure_prompt_ending
) = (set_color normal)' '
