set SUCCESS 0
set FAILURE 1

function _pure_format_time \
    --description="Format milliseconds to a human readable format" \
    --argument-names milliseconds threshold show_subsecond

    test $milliseconds -lt 0; and return $FAILURE
    test $milliseconds -lt (math --scale=0 "$threshold * 1000"); and echo; and return $SUCCESS

    set --local time

    set --local days (math --scale=0 "$milliseconds / 86400000")
    test $days -gt 0; and set --append time (printf "%sd" $days)

    set --local hours (math --scale=0 "$milliseconds / 3600000 % 24")
    test $hours -gt 0; and set --append time (printf "%sh" $hours)

    set --local minutes (math --scale=0 "$milliseconds / 60000 % 60")
    test $minutes -gt 0; and set --append time (printf "%sm" $minutes)

    set --local seconds (math --scale=0 "$milliseconds / 1000 % 60")
    if test $show_subsecond = true
        if test $milliseconds -gt 0
            set --local subsec (string sub --start -3 --length 2 00$milliseconds | string trim --right --chars 0)
            set --append time $seconds(test -n "$subsec"; and echo '.'$subsec; or echo)'s'
        end
    else
        test $seconds -gt 0; and set --append time (printf "%ss" $seconds)
    end

    echo -e (string join ' ' $time)
end
