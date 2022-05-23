source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/../functions/_pure_print_prompt.fish
source (dirname (status filename))/../functions/_pure_string_width.fish
@echo (_print_filename (status filename))


function setup
    _purge_configs
    _disable_colors
end; setup

@test "_pure_print_prompt: returns nothing when no argument provided" (
    _pure_print_prompt
) = $EMPTY

@test "_pure_print_prompt: trims prompt left side" (
    _pure_print_prompt " user host "
) = 'user host '

@test "_pure_print_prompt: ignores color change argument" (
    _pure_print_prompt (set_color red)
) = $EMPTY

@test "_pure_print_prompt: allow colored argument" (
    _pure_print_prompt ""(set_color red)"hello"
) = (set_color red)'hello'

@test "_pure_print_prompt: multiple arguments" (
    _pure_print_prompt "#" ">"
) = '# >'

@test "_pure_print_prompt: multiple arguments with colors" (
    _pure_print_prompt ""(set_color red)"#" ">"
) = ""(set_color red)"# >"
