function _pure_prompt_ssh
    if test "$SSH_CONNECTION" != ""
        echo (_pure_user_at_host)
    end
end
