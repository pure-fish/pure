function _pure_prompt_container
    _pure_is_inside_container
    echo _pure_is_inside_container $status
    if _pure_is_inside_container
        echo (_pure_user_at_host)
    end
end
