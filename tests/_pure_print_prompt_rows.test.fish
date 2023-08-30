source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_is_single_line_prompt.fish
source (status dirname)/../functions/_pure_print_prompt_rows.fish
@echo (_print_filename (status filename))


function before_each
    _purge_configs
    _disable_colors
    _mock_response _pure_prompt_first_line $EMPTY

end
function after_all
    _pure_unmock _pure_prompt_first_line
end


before_each
@test "_pure_print_prompt_rows: end with newline by default" (
    set --universal pure_enable_single_line_prompt false

    _pure_print_prompt_rows | wc -l
) = $IS_PRESENT

before_each
@test "_pure_print_prompt_rows: end WITHOUT newline when compact-prompt is enable" (
    set --universal pure_enable_single_line_prompt true

    _pure_print_prompt_rows | wc -l
) = $NONE


after_all
