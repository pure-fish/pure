source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_nixdevshell.fish
source (status dirname)/../functions/_pure_prompt_nixdevshell_type.fish
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

    # when executing the tests in nixos builds, /nix/store paths are in the $PATH variable
    begin
        set --local --export PATH /bin/bash

        _pure_prompt_nixdevshell
    end
) $status -eq $SUCCESS

before_each
@test "_pure_prompt_nixdevshell: show prompt and status inside nix dev shell" (
    set --universal pure_enable_nixdevshell true
    set --universal pure_symbol_nixdevshell_prefix "󱄅 "
    set IN_NIX_SHELL pure

    _pure_prompt_nixdevshell
) = "󱄅 pure"

before_each
@test "_pure_prompt_nixdevshell: show prompt and status inside nix dev shell" (
    set --universal pure_enable_nixdevshell true
    set --universal pure_symbol_nixdevshell_prefix "󱄅 "
    set IN_NIX_SHELL impure

    _pure_prompt_nixdevshell
) = "󱄅 impure"

before_each
@test "_pure_prompt_nixdevshell: show prompt and status inside nix shell" (
    set --universal pure_enable_nixdevshell true
    set --universal pure_symbol_nixdevshell_prefix "󱄅 "

    begin
        set --local --export PATH /nix/store/lz9gfg6iybsh0hiignpk55w99a3bj4vb-hello-2.12.1/bin:/bin

        _pure_prompt_nixdevshell
    end
) = "󱄅 unknown"
