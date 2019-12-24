source $current_dirname/../functions/_pure_prompt_ssh_user.fish
source $current_dirname/../functions/_pure_set_color.fish

@test "_pure_prompt_ssh_user: colorize standard user" (
    set --global pure_color_ssh_user_normal green

    _pure_prompt_ssh_user

) = (set_color green)(whoami)

@test "_pure_prompt_ssh_user: colorize root user" (
    function whoami  # mock
        echo 'root'
    end

    set --global pure_color_ssh_user_root red

    _pure_prompt_ssh_user

) = (set_color red)'root'
