source $current_dirname/../functions/_pure_format_time.fish

set --local threshold 0 # in seconds
set --local empty ''
set --local fail 1

@test "_pure_format_time: throws error on negative time" (
        set --local negative_duration -1
        _pure_format_time $negative_duration $threshold
    ) $status -eq $fail
end

@test "_pure_format_time: returns nothing if duration is below thresold time" (
        set --local duration 0 # ms
        set --local threshold 1 # ms
        _pure_format_time $duration $threshold
    ) = $empty
end

set --local seconds 1000 # express as milliseconds
@test "_pure_format_time: format 1s to human" (
    _pure_format_time (math "1*$seconds") $threshold
) = '1s'
end

@test "_pure_format_time: format 60s as a minutes to human" (
    _pure_format_time (math "60*$seconds") $threshold
) = '1m'
end

set --local minutes 60000  # express as milliseconds
@test "_pure_format_time: format 59 minutes to human" (
     _pure_format_time (math "59*$minutes") $threshold
    ) = '59m'
end

@test "_pure_format_time: format 60min as an hour to human" (
     _pure_format_time (math "60*$minutes") $threshold
    ) = '1h'
end

set --local hours 3600000  # express as milliseconds
@test "_pure_format_time: format 23 hours to human" (
     _pure_format_time (math "23*$hours") $threshold
    ) = '23h'
end

@test "_pure_format_time: format 24 hours as a day to human" (
     _pure_format_time (math "24*$hours") $threshold
    ) = '1d'
end

set --local days 86400000  # express as milliseconds
@test "_pure_format_time: format days to human" (
     _pure_format_time (math "100*$days") $threshold
    ) = '100d'
end

@test "_pure_format_time: format complex duration to human" (
     _pure_format_time 123456789 $threshold
    ) = '1d 10h 17m 36s'
end