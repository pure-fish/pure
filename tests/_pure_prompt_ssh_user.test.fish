source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_ssh_user.fish
source $current_dirname/../functions/_pure_set_color.fish
@mesg (_print_filename $current_filename)


@test "_pure_prompt_ssh_user: colorize standard user" (
    set --global pure_color_ssh_user_normal green

    _pure_prompt_ssh_user

) = (set_color green)(id -u -n)

@test "_pure_prompt_ssh_user: colorize root user" (
    function id; echo 'root'; end # mock

    set --global pure_color_ssh_user_root red

    _pure_prompt_ssh_user

) = (set_color red)'root'
