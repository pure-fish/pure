source $current_dirname/../functions/fish_greeting.fish

set --local succeed 0
function _pure_check_for_new_release; echo ''; end

@test "fish_greeting: succeed" (
    fish_greeting
) $status -eq $succeed

@test "fish_greeting: returns nothing" (
    fish_greeting
) -z
