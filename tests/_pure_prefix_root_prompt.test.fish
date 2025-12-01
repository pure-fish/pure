source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_prefix_root_prompt.fish
@echo (_print_filename (status filename))


function before_each
    _purge_configs
    _disable_colors
    set --universal pure_symbol_prefix_root_prompt '#'
end
before_each

before_each
@test "_pure_prefix_root_prompt: is empty for unprivileged user" (
    set --universal pure_show_prefix_root_prompt true
    _mock_response id 'nemo'

    _pure_prefix_root_prompt
) = $EMPTY

before_each
@test "_pure_prefix_root_prompt: is shown for `root` user" (
    set --universal pure_show_prefix_root_prompt true
    _mock_response id 'root'

    _pure_prefix_root_prompt
) = "#"

before_each
@test "_pure_prefix_root_prompt: colorize root prefix symbol" (
    _pure_unmock _pure_set_color # enable colors
    set --universal pure_show_prefix_root_prompt true
    set --universal pure_color_prefix_root_prompt red
    _mock_response id 'root'

    _pure_prefix_root_prompt
) = (set_color red)"#"

before_each
@test "_pure_prefix_root_prompt: require flag" (
    set --universal pure_show_prefix_root_prompt false
    _mock_response id 'root'

    _pure_prefix_root_prompt
) = $EMPTY
