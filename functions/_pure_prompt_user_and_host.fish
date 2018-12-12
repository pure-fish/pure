function _pure_prompt_user_and_host
    if [ "$SSH_CONNECTION" != "" ]
        echo (_pure_prompt_user)(_pure_prompt_at)(_pure_prompt_host)
    end
end
