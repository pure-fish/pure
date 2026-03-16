function _pure_prompt_system_time --description "Display system time"
    if set --query pure_show_system_time; and test "$pure_show_system_time" = true
        set --local time_color (_pure_set_color $pure_color_system_time)
        if set --query pure_system_time_format
            echo "$time_color"(date $pure_system_time_format)
        else
            echo "$time_color"(date '+%T')
        end
    end
end
