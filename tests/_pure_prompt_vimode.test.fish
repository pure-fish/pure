source $DIRNAME/../functions/_pure_prompt_vimode.fish

set --local EMPTY ''

test "hide vimode by default"
    (
        _pure_prompt_vimode
    ) = $EMPTY
end
