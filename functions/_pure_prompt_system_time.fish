function _pure_prompt_system_time --description "Display system time"
    if set --query pure_show_system_time; and test "$pure_show_system_time" = true
        set --local time_color (_pure_set_color $pure_color_system_time)
        echo "$time_color"(date '+%T')
    end
end
