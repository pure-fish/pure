function _pure_prompt_vimode
    if set --query pure_reverse_prompt_symbol_in_vimode; and test "$pure_reverse_prompt_symbol_in_vimode" = false
      echo (fish_default_mode_prompt)
    end
end
