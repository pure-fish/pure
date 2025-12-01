source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/fish_prompt.fish
source (status dirname)/../functions/_pure_print_prompt_rows.fish
source (status dirname)/../functions/_pure_is_single_line_prompt.fish

source (status dirname)/../functions/_pure_prompt_transient.fish
source (status dirname)/../functions/_pure_prompt_symbol.fish
source (status dirname)/../functions/_pure_get_prompt_symbol.fish
source (status dirname)/../functions/_pure_print_prompt.fish
source (status dirname)/../functions/_pure_string_width.fish
@echo (_print_filename (status filename))

function before_each
    _purge_configs
    _disable_colors

    function _pure_prompt_first_line --description "stub function"
        echo '/path/ git duration'
    end
    function _pure_place_iterm2_prompt_mark --description "stub function"
    end
    function _pure_prompt --description "stub function"
        echo ' ❯'
    end
    function _pure_prompt_ending --description "stub function"
        echo ']'
    end
end

function after_each --description "erasing stubs"
    functions --erase \
        _pure_prompt_first_line \
        _pure_place_iterm2_prompt_mark \
        _pure_prompt \
        _pure_prompt_ending

    _clean_all_mocks
    _clean_all_spy_calls
end

before_each
@test "fish_prompt: succeed" (
    fish_prompt 2>&1 >/dev/null
) $status -eq $SUCCESS
after_each

before_each
@test "fish_prompt: print segments" (
    set --universal pure_enable_single_line_prompt true

    fish_prompt | string collect --no-trim-newlines
) = '/path/ git duration ❯]'
after_each

before_each
@test "fish_prompt: change with exit status" (
    set --universal pure_enable_single_line_prompt true
    function _pure_prompt; echo ' fail❯'; end

    fish_prompt
) = '/path/ git duration fail❯]'
after_each

before_each
@test "fish_prompt: disable _pure_fresh_session" (
    set --global _pure_fresh_session  # so we can see its update

    fish_prompt 2>&1 >/dev/null

    echo $_pure_fresh_session
) = false
after_each

before_each
@test "fish_prompt: use 2-lines prompt by default" (
    set --universal pure_enable_single_line_prompt false
    fish_prompt | wc -l | string trim --left # macos prepends spaces
) = 1 # see https://github.com/pure-fish/pure/pull/381
after_each

before_each
@test "fish_prompt: use 1-line compact-prompt" (
    set --universal pure_enable_single_line_prompt true

    fish_prompt | wc -l | string trim --left # macos prepends spaces
) = 0 # see https://github.com/pure-fish/pure/pull/381
after_each

before_each
@test "fish_prompt: normal prompt when transient mode is disabled (single line)" (
    set --universal fish_transient_prompt $NONE
    set --universal pure_enable_single_line_prompt true

    fish_prompt | string collect --no-trim-newlines
) = '/path/ git duration ❯]'
after_each

before_each
@test "fish_prompt: normal prompt when transient mode is disabled (multi lines)" (
    set --universal fish_transient_prompt $NONE
    set --universal pure_enable_single_line_prompt false

    fish_prompt | string collect --no-trim-newlines
) = /path/\ git\ duration\n\ ❯\]
after_each

before_each
@test "fish_prompt: does not call _pure_prompt when transient mode is disabled" (
    set --universal fish_transient_prompt $NONE
    set --universal pure_symbol_prompt '>'
    
    # Override to detect if called
    function _pure_prompt
        echo 'FULL_PROMPT_CALLED'
    end

    fish_prompt --final-rendering
) = '>]'
after_each

before_each
@test "fish_prompt: does not call _pure_prompt_transient when transient mode is disabled" (
    set --universal fish_transient_prompt $NONE
    _spy _pure_prompt_transient

    fish_prompt > /dev/null
    _has_called _pure_prompt_transient
) $status -eq $FAILURE
after_each

before_each
@test "fish_prompt: shows transient prompt (simplified symbol only)" (
    set --universal fish_transient_prompt $IS_PRESENT
    set --universal pure_symbol_prompt '>'
    _mock_response _pure_prompt_ending ']'

    fish_prompt --final-rendering
) = '>]'
after_each

before_each
@test "fish_prompt: call _pure_prompt_transient when transient mode is enabled" (
    set --universal fish_transient_prompt $IS_PRESENT
    _spy _pure_prompt_transient

    fish_prompt --final-rendering  > /dev/null

    _has_called _pure_prompt_transient
) $status -eq $SUCCESS
after_each

before_each
@test "fish_prompt: does not call _pure_prompt when transient mode is enabled" (
    set --universal fish_transient_prompt $IS_PRESENT
    _spy _pure_prompt

    fish_prompt --final-rendering > /dev/null

    _has_called _pure_prompt
) $status -eq $FAILURE
after_each

before_each
@test "fish_prompt: normal prompt when transient mode is disabled (single line)" (
    set --universal fish_transient_prompt $IS_PRESENT
    set --universal pure_symbol_prompt '>'
    _mock_response _pure_prompt_ending ']'

    echo (
        fish_prompt --final-rendering
        fish_prompt
    ) | string collect --no-trim-newlines
) = \>\]/path/\ git\ duration\ \ ❯\]\n
after_each
