source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_ending.fish
@echo (_print_filename (status filename))


function before_all
    _purge_configs
    _disable_colors
end
before_all


@test "_pure_prompt_ending: reset color to normal" (
    _pure_prompt_ending
) = (set_color normal)' '
