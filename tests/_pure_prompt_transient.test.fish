source (status dirname)/../tools/versions-compare.fish
@echo (_print_filename (status filename))

if fish_version_at_least 4.1.0
    source (status dirname)/fixtures/constants.fish
    source (status dirname)/mocks/spectra.fish
    source (status dirname)/../functions/_pure_prompt_transient.fish
    source (status dirname)/../functions/_pure_prompt_symbol.fish
    source (status dirname)/../functions/_pure_get_prompt_symbol.fish
    source (status dirname)/../functions/_pure_print_prompt.fish
    source (status dirname)/../functions/_pure_string_width.fish

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
    @test "_pure_prompt_transient: shows prompt symbol when last command succeed" (
        set --universal pure_enable_single_line_prompt false
        set --universal pure_color_prompt_on_success magenta

        _pure_prompt_transient $SUCCESS
    ) = (set_color $pure_color_prompt_on_success)'>'

    before_each
    @test "_pure_prompt_transient: shows prompt symbol in red when last command failed" (
        set --universal pure_enable_single_line_prompt false
        set --universal pure_color_prompt_on_error red

        _pure_prompt_transient $FAILURE
    ) = (set_color $pure_color_prompt_on_error)'>'

    after_all
end
