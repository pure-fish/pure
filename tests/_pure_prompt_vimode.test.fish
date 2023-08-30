source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_vimode.fish
source (status dirname)/../tools/versions-compare.fish

@echo (_print_filename (status filename))

function before_each
    _purge_configs
    _disable_colors
end

function after_all
    set fish_key_bindings fish_default_key_bindings
end

before_each
@test "_pure_prompt_vimode: hides vimode prompt by default" (
    echo (_pure_prompt_vimode)
) = $EMPTY

before_each
@test "_pure_prompt_vimode: show reverse prompt symbol when enable" (
    set --universal pure_reverse_prompt_symbol_in_vimode true

    echo (_pure_prompt_vimode)
) = $EMPTY

if fish_version_below 3.3.0
    before_each
    @test "_pure_prompt_vimode: show vi_mode when reverse prompt symbol is disable (for v3.1.2)" (
    set fish_key_bindings fish_vi_key_bindings
    set --universal pure_reverse_prompt_symbol_in_vimode false

    _pure_prompt_vimode
    after_all
) = (set_color --bold --background red white)'[N] '(set_color normal)' '
end


if fish_version_at_least 3.3.0
    before_each
    @test "_pure_prompt_vimode: show vi_mode when reverse prompt symbol is disable (for ≥v3.3.0)" (
    set fish_key_bindings fish_vi_key_bindings
    set --universal pure_reverse_prompt_symbol_in_vimode false

    _pure_prompt_vimode
    after_all
) = (set_color --bold red)'[N] '(set_color normal)' ' # see value from https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_default_mode_prompt.fish
end
