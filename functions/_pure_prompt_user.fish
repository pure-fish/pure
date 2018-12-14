function _pure_prompt_user
    set --local username (whoami)
    set --local username_color "$pure_color_ssh_username"  # default color
    if [ "$username" = "root" ]
        set username_color "$pure_color_ssh_root" # different color for root
    end

    echo "$username_color$username"
end
