source $DIRNAME/../functions/_pure_prompt_user.fish

test "colorize standard user"
    (
        set pure_username_color (set_color green)

        _pure_prompt_user

    ) = (set_color green)(whoami)
end

test "colorize root user"
    (
        function whoami  # mock
            echo 'root'
        end

        set pure_root_color (set_color red)

        _pure_prompt_user

    ) = (set_color red)'root'
end
