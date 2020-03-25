set FAILURE 1

function _pure_format_time \
    --description="Format milliseconds to a human readable format" \
    --argument-names milliseconds threshold show_subsecond

    test $milliseconds -lt 0; and return $fail
    test $milliseconds -lt (math -s0 "$threshold * 1000"); and echo; and return 0

    set --local time

    set --local days (math -s0 "$milliseconds / 86400000")
    test $days -gt 0; and set time $time (printf "%sd" $days)

    set --local hours (math -s0 "$milliseconds / 3600000 % 24")
    test $hours -gt 0; and set time $time (printf "%sh" $hours)

    set --local minutes (math -s0 "$milliseconds / 60000 % 60")
    test $minutes -gt 0; and set time $time (printf "%sm" $minutes)

    set --local seconds (math -s0 "$milliseconds / 1000 % 60")
    if test $show_subsecond = true
        if test $milliseconds -gt 0
            set --local subsec (string sub -s -3 -l 2 00$milliseconds | string trim -r -c 0)
            set time $time $seconds(test -n "$subsec"; and echo '.'$subsec; or echo)'s'
        end
    else
        test $seconds -gt 0; and set time $time (printf "%ss" $seconds)
    end

    echo -e (string join ' ' $time)
end
