source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_prefix_private_prompt.fish
@echo (_print_filename (status filename))

function before_each
    set --erase fish_private_mode
    _purge_configs
    _disable_colors
    set --universal pure_symbol_prefix_private_prompt '%'
end

before_each
@test "_pure_prefix_private_prompt: is empty for normal mode" (
    set --universal pure_show_prefix_private_prompt true
    set fish_private_mode 0

    _pure_prefix_private_prompt
) = $EMPTY

before_each
@test "_pure_prefix_private_prompt: is empty for normal mode when variable is not defined" (
    set --universal pure_show_prefix_private_prompt true

    _pure_prefix_private_prompt
) = $EMPTY

before_each
@test "_pure_prefix_private_prompt: is shown for private mode" (
    set --universal pure_show_prefix_private_prompt true
    set fish_private_mode 1

    _pure_prefix_private_prompt
) = "%"

before_each
@test "_pure_prefix_private_prompt: colorize private prefix symbol" (
    _pure_unmock _pure_set_color # enable colors
    set --universal pure_show_prefix_private_prompt true
    set --universal pure_color_prefix_private_prompt red
    set fish_private_mode 1

    _pure_prefix_private_prompt
) = (set_color red)"%"

before_each
@test "_pure_prefix_private_prompt: require flag" (
    set --universal pure_show_prefix_private_prompt false
    set fish_private_mode 1

    _pure_prefix_private_prompt
) = $EMPTY
