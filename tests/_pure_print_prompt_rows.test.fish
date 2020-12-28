source $current_dirname/fixtures/constants.fish
# source $current_dirname/../functions/_pure_prompt_first_line.fish
source $current_dirname/../functions/_pure_print_prompt_rows.fish

function setup
    function _pure_prompt_first_line; echo $EMPTY; end
end

@test "_pure_print_prompt_rows: end with newline by default" (
    _pure_print_prompt_rows | wc -l
) = 1

@test "_pure_print_prompt_rows: end WITHOUT newline when compact-prompt is enable" (
    set pure_enable_single_line_prompt true

    _pure_print_prompt_rows | wc -l
) = 0
