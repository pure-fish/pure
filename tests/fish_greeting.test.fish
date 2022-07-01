source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/../functions/fish_greeting.fish
@echo (_print_filename (status filename))



function before_each
    _purge_configs
    _disable_colors
end

function _pure_check_for_new_release --description "stub function"
    return $SUCCESS
end

before_each
@test "fish_greeting: succeeds" (
    fish_greeting
) $status -eq $SUCCESS

before_each
@test "fish_greeting: returns nothing" (
    fish_greeting
) -z
