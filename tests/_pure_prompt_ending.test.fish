source $current_dirname/../functions/_pure_prompt_ing.fish

@test "_pure_prompt_ing: reset color to normal" (
    set pure_color_normal (set_color normal)
    
    _pure_prompt_ing
) = (set_color normal)' '

