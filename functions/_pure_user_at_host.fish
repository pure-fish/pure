function _pure_user_at_host
    set --local username (id -u -n) # current user name
    set --local at_sign "@"
    set --local at_sign_color (_pure_set_color $pure_color_at_sign)
    set --local hostname_color (_pure_set_color $pure_color_hostname)

    set --local username_color (_pure_set_color $pure_color_username_normal) # default color
    if test "$username" = root
        set username_color (_pure_set_color $pure_color_username_root) # different color for root
    end

    echo "$username_color$username$at_sign_color$at_sign$hostname_color$hostname"
end
