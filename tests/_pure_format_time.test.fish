source $DIRNAME/../functions/_pure_format_time.fish

set --local THRESHOLD 0 # in seconds
set --local EMPTY ''
set --local FAIL 1

test "throws error on negative time"
    (
        set --local negative_duration -1
        _pure_format_time $negative_duration $THRESHOLD
    ) $status -eq $FAIL
end

test "returns nothing if duration is below thresold time"
    (
        set --local duration 0 # ms
        set --local threshold 1 # ms
        _pure_format_time $duration $threshold
    ) = $EMPTY
end

set --local SECONDS 1000 # express as milliSECONDS
test "format 1s to human"
    '1s' = (_pure_format_time (math "1*$SECONDS") $THRESHOLD)
end

test "format 60s as a minutes to human"
    '1m' = (_pure_format_time (math "60*$SECONDS") $THRESHOLD)
end

set --local MINUTES 60000  # express as milliseconds
test "format 59 minutes to human"
    '59m' = ( _pure_format_time (math "59*$MINUTES") $THRESHOLD)
end

test "format 60min as an hour to human"
    '1h' = ( _pure_format_time (math "60*$MINUTES") $THRESHOLD)
end

set --local HOURS 3600000  # express as milliseconds
test "format 23 hours to human"
    '23h' = ( _pure_format_time (math "23*$HOURS") $THRESHOLD)
end

test "format 24 hours as a day to human"
    '1d' = ( _pure_format_time (math "24*$HOURS") $THRESHOLD)
end

set --local days 86400000  # express as milliseconds
test "format days to human"
    '100d' = ( _pure_format_time (math "100*$days") $THRESHOLD)
end

test "format complex duration to human"
    '1d 10h 17m 36s' = ( _pure_format_time 123456789 $THRESHOLD)
end