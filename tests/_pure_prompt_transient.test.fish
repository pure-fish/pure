source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_prompt_transient.fish
source (status dirname)/../functions/_pure_prompt_symbol.fish
source (status dirname)/../functions/_pure_get_prompt_symbol.fish
source (status dirname)/../functions/_pure_print_prompt.fish
source (status dirname)/../functions/_pure_string_width.fish
@echo (_print_filename (status filename))


function before_all
    _purge_configs
    _disable_colors

    set --universal pure_symbol_prompt '>' # using default ❯ breaks following tests
end
before_all


@test "_pure_prompt_transient: shows prompt symbol when last command succeed" (
    _pure_unmock _pure_set_color # enable colors
    set --local last_command $SUCCESS
    set --universal pure_color_prompt_on_success green

    _pure_prompt_transient $last_command
) = (set_color green)'>'

@test "_pure_prompt_transient: shows prompt symbol in red when last command failed" (
    _pure_unmock _pure_set_color # enable colors
    set --local last_command $FAILURE
    set --universal pure_color_prompt_on_error red

    _pure_prompt_transient $last_command
) = (set_color red)'>'

@test "_pure_prompt_transient: uses default success color when exit_code is 0" (
    _pure_unmock _pure_set_color # enable colors
    set --universal pure_color_prompt_on_success magenta

    _pure_prompt_transient 0
) = (set_color magenta)'>'

@test "_pure_prompt_transient: uses error color when exit_code is non-zero" (
    _pure_unmock _pure_set_color # enable colors
    set --universal pure_color_prompt_on_error yellow

    _pure_prompt_transient 1
) = (set_color yellow)'>'
