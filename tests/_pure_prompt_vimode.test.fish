source $DIRNAME/../functions/_pure_prompt_vimode.fish

set --local empty ''

test "hides vimode prompt by default"
    (
        _pure_prompt_vimode
    ) = $empty
end

test "shows default vimode prompt"
    (
        set fish_key_bindings fish_vi_key_bindings

        _pure_prompt_vimode
    ) = (set_color --bold --background red white)'[N] '(set_color normal)' '
end

function teardown
    set fish_key_bindings fish_default_key_bindings
end
