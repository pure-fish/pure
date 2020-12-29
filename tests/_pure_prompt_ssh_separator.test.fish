source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_ssh_separator.fish
source $current_dirname/../functions/_pure_set_color.fish
@mesg (print_filename $current_filename)


@test "_pure_prompt_ssh_separator: display at symbol" (
    set --global pure_color_ssh_separator ""

    _pure_prompt_ssh_separator
) = '@'

@test "_pure_prompt_ssh_separator: display colored at symbol" (
    set --global pure_color_ssh_separator grey

    _pure_prompt_ssh_separator
) = (set_color grey)'@'
