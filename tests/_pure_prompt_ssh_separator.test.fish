source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_ssh_separator.fish
@mesg (_print_filename $current_filename)


function setup
    _purge_configs
    _disable_colors
end


@test "_pure_prompt_ssh_separator: display at symbol" (
    set --universal pure_color_ssh_separator ""

    _pure_prompt_ssh_separator
) = '@'

@test "_pure_prompt_ssh_separator: display colored at symbol" (
    source $current_dirname/../functions/_pure_set_color.fish
    set --universal pure_color_ssh_separator grey

    _pure_prompt_ssh_separator
) = (set_color grey)'@'
