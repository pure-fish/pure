function _pure_prompt_ssh
    if test "$SSH_CONNECTION" != ""
        echo "$pure_symbol_ssh_prefix"(_pure_user_at_host)
    end
end
