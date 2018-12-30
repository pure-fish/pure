function _pure_prompt_user_and_host
    if test -n "$SSH_CONNECTION"  # we are on a host through SSH
        echo (_pure_prompt_user)(_pure_prompt_at)(_pure_prompt_host)
    end
end
