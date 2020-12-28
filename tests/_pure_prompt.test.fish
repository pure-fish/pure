source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt.fish
source $current_dirname/../functions/_pure_prompt_jobs.fish
source $current_dirname/../functions/_pure_prompt_virtualenv.fish
source $current_dirname/../functions/_pure_prompt_vimode.fish
source $current_dirname/../functions/_pure_prompt_symbol.fish
source $current_dirname/../functions/_pure_set_color.fish
source $current_dirname/../functions/_pure_get_prompt_symbol.fish
source $current_dirname/../functions/_pure_print_prompt.fish
source $current_dirname/../functions/_pure_string_width.fish
source $current_dirname/../functions/_pure_prompt_system_time.fish
source $current_dirname/../functions/_pure_prefix_root_prompt.fish


function teardown
    set --erase pure_show_prefix_root_prompt
    set --erase pure_symbol_prefix_root_prompt
    set --erase pure_color_prefix_root_prompt
    set --erase pure_enable_compact_prompt
    set --erase pure_color_prompt_on_success
end

@test "_pure_prompt: print prompt after succeeding command" (
    set pure_color_prompt_on_success magenta
    set pure_symbol_prompt '>'  # using default ❯ break following tests
    set --local last_command $SUCCESS

    _pure_prompt $last_command
) = (set_color magenta)'>'

@test "_pure_prompt: print prompt after failing command" (
    set pure_color_prompt_on_error red
    set pure_symbol_prompt '>'  # using default ❯ break following tests
    set --local last_command $FAILURE

    _pure_prompt $last_command
) = (set_color red)'>'

@test "_pure_prompt: print root prefix" (
    set --global pure_show_prefix_root_prompt true
    set --global pure_symbol_prefix_root_prompt '#'
    set --global pure_color_prefix_root_prompt $EMPTY
    set --global pure_color_prompt_on_success $EMPTY
    function id; echo 'root'; end # mock
    set --local last_command $SUCCESS

    _pure_prompt $last_command
) = "# >"

@test "_pure_prompt: no space before symbol in 2-lines prompt" (
    set --local last_command $SUCCESS
    set --global pure_enable_compact_prompt false

    _pure_prompt $last_command
) = ">"

@test "_pure_prompt: space before symbol in 1-line prompt" (
    set --local last_command $SUCCESS
    set --global pure_enable_compact_prompt true

    _pure_prompt $last_command
) = " >"
