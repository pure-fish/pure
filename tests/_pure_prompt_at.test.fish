source $DIRNAME/../functions/_pure_prompt_at.fish

test "display at symbol"
    (
        set pure_color_gray ""

        _pure_prompt_at
    ) = '@'
end

test "display colored at symbol"
    (
        set pure_color_gray (set_color grey)

        _pure_prompt_at
    ) = (set_color grey)'@'
end