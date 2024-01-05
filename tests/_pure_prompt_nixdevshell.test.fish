source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_nixdevshell.fish
@echo (_print_filename (status filename))

function before_each
    _purge_configs
    _disable_colors
    set --erase --global IN_NIX_SHELL
end


@test "_pure_prompt_nixdevshell: ensure default behaviour has no error" (
    _pure_prompt_nixdevshell
) $status -eq $SUCCESS

@test "_pure_prompt_nixdevshell: ensure default behaviour print nothing" (
    echo (_pure_prompt_nixdevshell)
) = $EMPTY

before_each
@test "_pure_prompt_nixdevshell: hide prompt outside nix dev shell" (
    set --universal pure_enable_nixdevshell true
    set --erase IN_NIX_SHELL

    _pure_prompt_nixdevshell
) $status -eq $SUCCESS

before_each
@test "_pure_prompt_nixdevshell: show prompt and status inside nix dev shell" (
    set --universal pure_enable_nixdevshell true
    set --universal pure_symbol_nixdevshell_prefix "󱄅 "
    set IN_NIX_SHELL pure

    _pure_prompt_nixdevshell
) = "󱄅 pure"
