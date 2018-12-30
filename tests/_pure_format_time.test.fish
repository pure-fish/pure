source $DIRNAME/../functions/_pure_format_time.fish

set --local threshold 0 # in seconds
set --local empty ''
set --local fail 1

test "throws error on negative time"
    (
        set --local negative_duration -1
        _pure_format_time $negative_duration $threshold
    ) $status -eq $fail
end

test "returns nothing if duration is below thresold time"
    (
        set --local duration 0 # ms
        set --local threshold 1 # ms
        _pure_format_time $duration $threshold
    ) = $empty
end

set --local seconds 1000 # express as milliseconds
test "format 1s to human"
    '1s' = (_pure_format_time (math "1*$seconds") $threshold)
end

test "format 60s as a minutes to human"
    '1m' = (_pure_format_time (math "60*$seconds") $threshold)
end

set --local minutes 60000  # express as milliseconds
test "format 59 minutes to human"
    '59m' = ( _pure_format_time (math "59*$minutes") $threshold)
end

test "format 60min as an hour to human"
    '1h' = ( _pure_format_time (math "60*$minutes") $threshold)
end

set --local hours 3600000  # express as milliseconds
test "format 23 hours to human"
    '23h' = ( _pure_format_time (math "23*$hours") $threshold)
end

test "format 24 hours as a day to human"
    '1d' = ( _pure_format_time (math "24*$hours") $threshold)
end

set --local days 86400000  # express as milliseconds
test "format days to human"
    '100d' = ( _pure_format_time (math "100*$days") $threshold)
end

test "format complex duration to human"
    '1d 10h 17m 36s' = ( _pure_format_time 123456789 $threshold)
end