source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/fish_prompt.fish
source (status dirname)/../functions/_pure_print_prompt_rows.fish
source (status dirname)/../functions/_pure_is_single_line_prompt.fish
@echo (_print_filename (status filename))


function before_all
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

function after_all --description "erasing stubs"
    functions --erase \
        _pure_prompt_first_line \
        _pure_place_iterm2_prompt_mark \
        _pure_prompt \
        _pure_prompt_ending
end


before_all

@test "fish_prompt: succeed" (
    fish_prompt 2>&1 >/dev/null
) $status -eq $SUCCESS

@test "fish_prompt: print segments" (
    set --universal pure_enable_single_line_prompt true

    fish_prompt | string collect --no-trim-newlines
) = '/path/ git duration ❯]'\n


@test "fish_prompt: change with exit status" (
    set --universal pure_enable_single_line_prompt true
    function _pure_prompt; echo ' fail❯'; end

    fish_prompt
) = '/path/ git duration fail❯]'

@test "fish_prompt: disable _pure_fresh_session" (
    set --global _pure_fresh_session  # so we can see its update

    fish_prompt 2>&1 >/dev/null

    echo $_pure_fresh_session
) = false

@test "fish_prompt: use 2-lines prompt by default" (
    set --universal pure_enable_single_line_prompt false
    fish_prompt | wc -l
) = 2

@test "fish_prompt: use 1-line compact-prompt" (
    set --universal pure_enable_single_line_prompt true

    fish_prompt | wc -l
) = 1

after_all
