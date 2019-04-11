source $current_dirname/../fish_mode_prompt.fish

set --local succeed 0

@test "fish_mode_prompt: succeed" (
    fish_mode_prompt
) $status -eq $succeed

@test "fish_mode_prompt: returns nothing" (
    fish_mode_prompt
) -z
