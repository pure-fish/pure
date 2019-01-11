source $DIRNAME/../functions/_pure_print_prompt.fish
source $DIRNAME/../functions/_pure_string_width.fish

set --local empty ''

test "_pure_print_prompt: returns nothing when no argument provided"
    (
        _pure_print_prompt
    ) = $empty
end

test "_pure_print_prompt: trims prompt left side"
    (
        _pure_print_prompt " user host "
    ) = 'user host '
end

test "_pure_print_prompt: ignores color change argument"
    (
        _pure_print_prompt (set_color red)
    ) = $empty
end

test "_pure_print_prompt: allow colored argument"
    (
        _pure_print_prompt ""(set_color red)"hello"
    ) = (set_color red)'hello'
end
