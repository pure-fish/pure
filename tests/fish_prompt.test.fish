source $current_dirname/../fish_prompt.fish

set --local succeed 0

function setup
    function _pure_prompt_beginning; echo '['; end
    function _pure_prompt_first_line; echo -e '/path/ git duration'; end
    function _pure_prompt; echo '❯'; end
    function _pure_prompt_ending; echo ']'; end
end

@test "fish_prompt: succeed" (
    fish_prompt 2>&1 >/dev/null
) $status -eq $succeed

@test "fish_prompt: print segments" (
    fish_prompt
) = '[/path/ git duration ❯]'

@test "fish_prompt: change with exit status" (
    function _pure_prompt; printf 'fail❯'; end

    fish_prompt
) = '[/path/ git duration fail❯]'

@test "fish_prompt: disable _pure_fresh_session" (
    set --global _pure_fresh_session  # so we can see its update

    fish_prompt 2>&1 >/dev/null

    echo $_pure_fresh_session
) = false
