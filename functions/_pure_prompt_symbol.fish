function _pure_prompt_symbol \
    --description 'Print prompt symbol' \
    --argument-names exit_code

    set --local reverse_symbol_instead_of_default_mode_prompt $pure_reverse_prompt_symbol_in_vimode
    set --local pure_symbol $pure_symbol_prompt
    set --local pure_symbol_reverse $pure_symbol_reverse

    set --local command_succeed 0

    set --local color_symbol $pure_color_prompt_on_success # default pure symbol color
    if test $exit_code -ne 0
        set color_symbol $pure_color_prompt_on_error  # different pure symbol color when previous command failed

        if test "$pure_separate_prompt_on_error" = true
            set color_symbol "$pure_color_prompt_on_error$pure_symbol_prompt$pure_color_prompt_on_success"
        end
    end

    if test reverse_symbol_instead_of_default_mode_prompt
      # Do nothing if not in vi mode
      if test "$fish_key_bindings" = "fish_vi_key_bindings"
          or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
          if test "$fish_bind_mode" = "insert"
              echo "$color_symbol$pure_symbol"
          else
              echo "$color_symbol$pure_symbol_reverse"
          end
      end

    else
      echo "$color_symbol$pure_symbol"
    end
end
