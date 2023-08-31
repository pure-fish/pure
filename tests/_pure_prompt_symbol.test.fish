source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_prompt_symbol.fish
source (status dirname)/../functions/_pure_get_prompt_symbol.fish
@echo (_print_filename (status filename))


function before_all
    _purge_configs
    _disable_colors

    set --universal pure_symbol_prompt '>' # using default ❯ break following tests
end
before_all


@test "_pure_prompt_symbol: colorizes prompt in green when last command succeed" (
    _pure_unmock _pure_set_color # enable colors
    set --local last_command $SUCCESS
    set --universal pure_color_prompt_on_success green

    _pure_prompt_symbol $last_command
) = (set_color green)'>'

@test "_pure_prompt_symbol: colorizes prompt in red when last command failed" (
    _pure_unmock _pure_set_color # enable colors
    set --local last_command $FAILURE
    set --universal pure_color_prompt_on_error red

    _pure_prompt_symbol $last_command
) = (set_color red)'>'

@test "_pure_prompt_symbol: add a magenta prompt when pure_separate_prompt_on_error is enable and last command failed" (
    _pure_unmock _pure_set_color # enable colors
    set --local last_command $FAILURE
    set --universal pure_color_prompt_on_error red
    set --universal pure_color_prompt_on_success magenta
    set --universal pure_separate_prompt_on_error true

    _pure_prompt_symbol $last_command
) = (set_color red)'>'(set_color magenta)'>'
