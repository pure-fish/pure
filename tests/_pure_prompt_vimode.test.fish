source $DIRNAME/../functions/_pure_prompt_vimode.fish

set --local EMPTY ''

test "hides vimode prompt by default"
    (
        _pure_prompt_vimode
    ) = $EMPTY
end

test "shows default vimode prompt"
    (
        set fish_key_bindings fish_vi_key_bindings

        _pure_prompt_vimode
    ) = (set_color --bold --background red white)'[N] '(set_color normal)' '
end
