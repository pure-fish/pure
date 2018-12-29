function _pure_prompt_user
    set --local username (whoami)
    set --local username_color "$pure_username_color"  # default color
    
    if [ "$username" = "root" ]
        set username_color "$pure_root_color" # different color for root
    end

    echo "$username_color$username"
end
