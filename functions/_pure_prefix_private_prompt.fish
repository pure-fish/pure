function _pure_prefix_private_prompt
    set --local prefix_private_prompt

    if set --query pure_show_prefix_private_prompt; and set --query fish_private_mode; and test "$pure_show_prefix_private_prompt" = true -a "$fish_private_mode" = 1
        set --local prefix_color (_pure_set_color $pure_color_prefix_private_prompt)
        set prefix_private_prompt "$prefix_color$pure_symbol_prefix_private_prompt"
    end

    echo "$prefix_private_prompt"
end
