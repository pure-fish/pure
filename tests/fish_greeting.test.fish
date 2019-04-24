source $current_dirname/../fish_greeting.fish

set --local succeed 0

@test "fish_greeting: succeed" (
    fish_greeting
) $status -eq $succeed

@test "fish_greeting: returns nothing" (
    fish_greeting
) -z
