source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_prompt.fish
source (status dirname)/../functions/_pure_prompt_jobs.fish
source (status dirname)/../functions/_pure_prompt_virtualenv.fish
source (status dirname)/../functions/_pure_prompt_vimode.fish
source (status dirname)/../functions/_pure_prompt_symbol.fish
source (status dirname)/../functions/_pure_get_prompt_symbol.fish
source (status dirname)/../functions/_pure_print_prompt.fish
source (status dirname)/../functions/_pure_string_width.fish
source (status dirname)/../functions/_pure_prompt_system_time.fish
source (status dirname)/../functions/_pure_prefix_root_prompt.fish
source (status dirname)/../functions/_pure_is_single_line_prompt.fish
@echo (_print_filename (status filename))

function before_each
    _purge_configs
    _disable_colors

    _pure_unmock _pure_set_color # enable colors
    set --universal pure_symbol_prompt '>' # using default ❯ break following tests
end

function after_all
    _clean_all_mocks
end

before_each
@test "_pure_prompt: print prompt after succeeding command" (
    set --universal pure_enable_single_line_prompt false
    set --universal pure_color_prompt_on_success magenta

    _pure_prompt $SUCCESS
) = (set_color $pure_color_prompt_on_success)'>'

before_each
@test "_pure_prompt: print prompt after failing command" (
    set --universal pure_enable_single_line_prompt false
    set --universal pure_color_prompt_on_error red

    _pure_prompt $FAILURE
) = (set_color $pure_color_prompt_on_error)'>'

before_each
@test "_pure_prompt: print root prefix" (
    set --universal pure_enable_single_line_prompt false
    set --universal pure_show_prefix_root_prompt true
    set --universal pure_symbol_prefix_root_prompt '#'
    set --universal pure_color_prompt_on_success magenta
    set --universal pure_color_prefix_root_prompt red
    _mock_response id 'root'

    _pure_prompt $SUCCESS
) = (set_color $pure_color_prefix_root_prompt)"# "(set_color $pure_color_prompt_on_success)">"

before_each
@test "_pure_prompt: no space before symbol in 2-lines prompt" (
    set --universal pure_enable_single_line_prompt false
    _mock _pure_set_color
    _mock_response id 'nemo'

    _pure_prompt $SUCCESS
) = ">"

before_each
@test "_pure_prompt: space before symbol in 1-line prompt" (
    set --universal pure_enable_single_line_prompt true
    _mock _pure_set_color
    _mock_response id 'nemo'

    _pure_prompt $SUCCESS
) = "$SPACE>"


after_all
