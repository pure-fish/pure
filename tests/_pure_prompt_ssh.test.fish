source $DIRNAME/../functions/_pure_prompt_ssh.fish
source $DIRNAME/../functions/_pure_prompt_ssh_user.fish
source $DIRNAME/../functions/_pure_prompt_ssh_separator.fish
source $DIRNAME/../functions/_pure_prompt_ssh_host.fish

set --local empty ''

test "hide 'user@hostname' when working locally"
    (
        set --erase SSH_CONNECTION

        _pure_prompt_ssh

    ) $status -eq 0
end

test "displays 'user@hostname' when on SSH connection"
    (
        set pure_color_ssh_user_normal $empty
        set pure_color_ssh_separator $empty
        set pure_color_ssh_host $empty
        set SSH_CONNECTION 127.0.0.1 56422 127.0.0.1 22
        function whoami  # mock
            echo 'user'
        end
        set hostname 'hostname'

        _pure_prompt_ssh

    ) = 'user@hostname'
end
