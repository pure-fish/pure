source $current_dirname/../functions/_pure_get_prompt_symbol.fish

@test "_pure_get_prompt_symbol: get default symbol ❯" (
    set pure_symbol_prompt '❯'

    _pure_get_prompt_symbol
) = '❯'

@test "_pure_get_prompt_symbol: get vi-mode symbol ❮" (
    set pure_reverse_prompt_symbol_in_vimode true
    set pure_symbol_reverse_prompt '❮'
    
    _pure_get_prompt_symbol
) = '❮'
