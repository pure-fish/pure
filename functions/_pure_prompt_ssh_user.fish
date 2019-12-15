function _pure_prompt_ssh_user
    set --local username (whoami) # current user name
    set --local username_color (_pure_get_var pure_color_ssh_user_normal $pure_color_mute) # default color

    if test "$username" = "root"
        set username_color (_pure_get_var pure_color_ssh_user_root $pure_color_light) # different color for root
    end

    echo "$username_color$username"
end
