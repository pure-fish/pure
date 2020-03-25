function _pure_get_prompt_symbol \
    --description 'Print prompt symbol' \
    --argument-names exit_code

    set --local prompt_symbol $pure_symbol_prompt
    test "$pure_reverse_prompt_symbol_in_vimode" = true
    and string match -rq "fish_(vi|hybrid)_key_bindings" $fish_key_bindings
    and not contains "$fish_bind_mode" insert replace
    and set prompt_symbol $pure_symbol_reverse_prompt

    echo "$prompt_symbol"
end
