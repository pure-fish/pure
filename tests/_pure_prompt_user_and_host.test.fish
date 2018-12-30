source $DIRNAME/../functions/_pure_prompt_user_and_host.fish

set --local empty ''

test "hide 'user@hostname' when working locally"
    (
        set --erase SSH_CONNECTION

        _pure_prompt_user_and_host

    ) $status -eq 0
end

test "displays 'user@hostname' when on SSH connection"
    (
        set pure_username_color $empty
        set pure_color_gray $empty
        set pure_host_color $empty
        set SSH_CONNECTION 127.0.0.1 56422 127.0.0.1 22
        function whoami  # mock
            echo 'user'
        end
        set hostname 'hostname'

        _pure_prompt_user_and_host

    ) = 'user@hostname'
end
