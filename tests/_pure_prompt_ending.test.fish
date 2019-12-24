source $current_dirname/../functions/_pure_prompt_ending.fish

@test "_pure_prompt_ending: reset color to normal" (
    _pure_prompt_ending
) = (set_color normal)' '
