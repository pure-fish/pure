source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/fish_mode_prompt.fish
@echo (_print_filename (status filename))


@test "fish_mode_prompt: succeed" (
    fish_mode_prompt
) $status -eq $SUCCESS

@test "fish_mode_prompt: returns nothing" (
    fish_mode_prompt
) -z
