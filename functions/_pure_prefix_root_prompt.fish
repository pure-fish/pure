function _pure_prefix_root_prompt
    set --local username (id --user --name) # current user name
    set --local prefix_root_prompt ''
    set --local space ' '

    if test $pure_show_prefix_root_prompt = true -a "$username" = "root"
        set --local prefix_color (_pure_set_color $pure_color_prefix_root_prompt)
        set prefix_root_prompt "$prefix_color$pure_symbol_prefix_root_prompt$space"
    end

    echo "$prefix_root_prompt"
end
