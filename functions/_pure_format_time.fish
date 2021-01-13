set SUCCESS 0
set FAILURE 1

function _pure_format_time \
    --description="Format milliseconds to a human readable format" \
    --argument-names \
        milliseconds \
        threshold \
        show_subsecond

    set --query show_subsecond[1]; or set show_subsecond false
    test "$milliseconds" -lt 0; and return $FAILURE
    test "$milliseconds" -lt (math --scale=0 "$threshold * 1000"); and echo; and return $SUCCESS

    set --local time
    set --local days (math --scale=0 "$milliseconds / 86400000")
    test "$days" -gt 0; and set --append time (printf "%sd" $days)
    set --local hours (math --scale=0 "$milliseconds / 3600000 % 24")
    test "$hours" -gt 0; and set --append time (printf "%sh" $hours)
    set --local minutes (math --scale=0 "$milliseconds / 60000 % 60")
    test "$minutes" -gt 0; and set --append time (printf "%sm" $minutes)
    set --local seconds (math --scale=0 "$milliseconds / 1000 % 60")

    if test "$show_subsecond" = true
        set --local threshold_as_ms (math --scale=0 "$threshold*1000")
        set --local subseconds (_pure_format_time_subseconds $milliseconds $threshold_as_ms)
        set --append time $seconds$subseconds's'
    else
        test "$seconds" -gt $threshold; and set --append time (printf "%ss" $seconds)
    end

    echo -e (string join ' ' $time)
end


function _pure_format_time_subseconds \
    --description="Format duration milliseconds to a human readable format" \
    --argument-names \
        duration \
        threshold

    set --local subseconds
    if test "$duration" -gt $threshold
        set --local precision 2
        set --local milliseconds (string sub --start -3 --length $precision $duration)
        set --append subseconds '.'$milliseconds
    end
    echo $subseconds
end
