source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_ssh_user.fish
@mesg (_print_filename $current_filename)


function setup
    _purge_configs
    _disable_colors
end


@test "_pure_prompt_ssh_user: colorize standard user" (
    source $current_dirname/../functions/_pure_set_color.fish # enable colors
    set --universal pure_color_ssh_user_normal green

    _pure_prompt_ssh_user
) = (set_color green)(id -u -n)

@test "_pure_prompt_ssh_user: colorize root user" (
    source $current_dirname/../functions/_pure_set_color.fish # enable colors
    function id; echo 'root'; end # mock
    set --universal pure_color_ssh_user_root red

    _pure_prompt_ssh_user
) = (set_color red)'root'
