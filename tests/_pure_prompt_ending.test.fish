source $DIRNAME/../functions/_pure_prompt_ending.fish

test "reset color to normal"
    (
        _pure_prompt_ending
    ) = (set_color normal)' '
end
