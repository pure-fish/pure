source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/../functions/_pure_prompt.fish
source (dirname (status filename))/../functions/_pure_prompt_jobs.fish
source (dirname (status filename))/../functions/_pure_prompt_virtualenv.fish
source (dirname (status filename))/../functions/_pure_prompt_vimode.fish
source (dirname (status filename))/../functions/_pure_prompt_symbol.fish
source (dirname (status filename))/../functions/_pure_get_prompt_symbol.fish
source (dirname (status filename))/../functions/_pure_print_prompt.fish
source (dirname (status filename))/../functions/_pure_string_width.fish
source (dirname (status filename))/../functions/_pure_prompt_system_time.fish
source (dirname (status filename))/../functions/_pure_prefix_root_prompt.fish
source (dirname (status filename))/../functions/_pure_is_single_line_prompt.fish
@echo (_print_filename (status filename))


function before_each
    _purge_configs
    _disable_colors

    source (dirname (status filename))/../functions/_pure_set_color.fish
    set --universal pure_symbol_prompt '>' # using default ❯ break following tests
end

function teardown
    functions --erase id
end


@test "_pure_prompt: print prompt after succeeding command" (
    before_each
    set --universal pure_color_prompt_on_success magenta

    _pure_prompt $SUCCESS
) = (set_color $pure_color_prompt_on_success)'>'

@test "_pure_prompt: print prompt after failing command" (
    before_each
    set --universal pure_color_prompt_on_error red

    _pure_prompt $FAILURE
) = (set_color $pure_color_prompt_on_error)'>'

@test "_pure_prompt: print root prefix" (
    before_each
    set --universal pure_show_prefix_root_prompt true
    set --universal pure_symbol_prefix_root_prompt '#'
    set --universal pure_color_prompt_on_success magenta
    set --universal pure_color_prefix_root_prompt red
    function id; echo 'root'; end # mock

    _pure_prompt $SUCCESS
) = (set_color $pure_color_prefix_root_prompt)"# "(set_color $pure_color_prompt_on_success)">"

@test "_pure_prompt: no space before symbol in 2-lines prompt" (
    before_each
    set --universal pure_enable_single_line_prompt false

    _pure_prompt $SUCCESS
) = ">"


@test "_pure_prompt: space before symbol in 1-line prompt" (
    before_each
    set --universal pure_enable_single_line_prompt true


    _pure_prompt $SUCCESS
) = "$SPACE>"


teardown
