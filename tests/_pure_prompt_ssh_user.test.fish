source $DIRNAME/../functions/_pure_prompt_ssh_user.fish

test "colorize standard user"
    (
        set pure_color_ssh_user_normal (set_color green)

        _pure_prompt_ssh_user

    ) = (set_color green)(whoami)
end

test "colorize root user"
    (
        function whoami  # mock
            echo 'root'
        end

        set pure_color_ssh_user_root (set_color red)

        _pure_prompt_ssh_user

    ) = (set_color red)'root'
end
