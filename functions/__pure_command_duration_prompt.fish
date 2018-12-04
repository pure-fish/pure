function format_time -d "Format milliseconds to a human readable format"
    set --local milliseconds $argv[1]
    set --local seconds (math -s0 "$milliseconds / 1000 % 60")
    set --local minutes (math -s0 "$milliseconds / 60000 % 60")
    set --local hours (math -s0 "$milliseconds / 3600000 % 24")
    set --local days (math -s0 "$milliseconds / 86400000")
    set --local time
    set --local threshold $argv[2]

    if test $days -gt 0
        set time $time (printf "%sd" $days)
    end

    if test $hours -gt 0
        set time $time (printf "%sh" $hours)
    end

    if test $minutes -gt 0
        set time $time (printf "%sm" $minutes)
    end

    if test $seconds -gt $threshold
        set time $time (printf "%ss" $seconds)
    end

    echo -e (string join ' ' $time)
end

function __pure_command_duration_prompt
    set --local command_duration
    
    # Get command execution duration
    if test -n "$CMD_DURATION"
        set command_duration (format_time $CMD_DURATION $pure_command_max_exec_time)
    end
    set --local command_duration_color "$pure_color_yellow"

    echo "$command_duration_color$command_duration"
end
