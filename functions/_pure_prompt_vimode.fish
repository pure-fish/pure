function _pure_prompt_vimode
    set --local reverse_symbol_instead_of_default_mode_prompt $pure_reverse_prompt_symbol_in_vimode
    if test ! reverse_symbol_instead_of_default_mode_prompt
      echo (fish_default_mode_prompt)
    end
end
