function _pure_prefix_root_prompt
    set --local username (id -u -n) # current user name
    set --local prefix_root_prompt

    if set --query pure_show_prefix_root_prompt; and test "$pure_show_prefix_root_prompt" = true -a "$username" = "root"
        set --local prefix_color (_pure_set_color $pure_color_prefix_root_prompt)
        set prefix_root_prompt "$prefix_color$pure_symbol_prefix_root_prompt"
    end

    echo "$prefix_root_prompt"
end
