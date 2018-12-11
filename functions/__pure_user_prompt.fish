function prompt_user
    set --local username (whoami) # current user name
    set --local username_color "$pure_username_color"  # default color
    if [ "$username" = "root" ]
        set username_color "$pure_root_color" # different color for root
    end

    echo "$username_color$username"
end

function prompt_at
    set --local at_symbol "@"
    set --local at_symbol_color "$pure_color_gray"

    echo "$at_symbol_color$at_symbol"
end

function prompt_host
    set --local host (hostname -s) # current host name
    set --local host_color "$pure_host_color"

    echo "$host_color$host"
end

function __pure_user_prompt
    if [ "$SSH_CONNECTION" != "" ]
        echo (prompt_user)(prompt_at)(prompt_host)
    end
end
