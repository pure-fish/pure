function _pure_prompt_container
    if test -n _pure_is_inside_container
        echo "$pure_symbol_container_prefix"(_pure_user_at_host)
    end
end
