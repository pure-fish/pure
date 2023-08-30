source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_beginning.fish
@echo (_print_filename (status filename))


function before_all
    _purge_configs
    _disable_colors
end
before_all


@test "_pure_prompt_beginning: clear line before printing prompt" (
    _pure_prompt_beginning
) = '\r\033[K'
