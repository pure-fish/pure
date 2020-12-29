source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_symbol.fish
source $current_dirname/../functions/_pure_get_prompt_symbol.fish
source $current_dirname/../functions/_pure_set_color.fish
@mesg (_print_filename $current_filename)


@test "_pure_prompt_symbol: colorizes prompt in green when last command succeed" (
    set --local last_command $SUCCESS
    set --global pure_symbol_prompt '>'  # using default ❯ break following tests
    set --global pure_color_prompt_on_success green

    _pure_prompt_symbol $last_command
) = (set_color green)'>'

@test "_pure_prompt_symbol: colorizes prompt in red when last command failed" (
    set --local last_command $FAILURE
    set --global pure_symbol_prompt '>'  # using default ❯ break following tests
    set --global pure_color_prompt_on_error red

    _pure_prompt_symbol $last_command
) = (set_color red)'>'

@test "_pure_prompt_symbol: add a magenta prompt when pure_separate_prompt_on_error is enable and last command failed" (
    set --local last_command $FAILURE
    set --global pure_symbol_prompt '>'  # using default ❯ break following tests
    set --global pure_color_prompt_on_error red
    set --global pure_color_prompt_on_success magenta
    set --global pure_separate_prompt_on_error true

    _pure_prompt_symbol $last_command
) = (set_color red)'>'(set_color magenta)'>'
