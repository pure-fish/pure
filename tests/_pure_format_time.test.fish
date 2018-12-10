source $DIRNAME/../functions/_pure_format_time.fish

set --local THRESHOLD 0  # in seconds
set --local EMPTY
set --local FAIL 1

test "throws error on negative time"
    (
        set --local negative_duration -1
        _pure_format_time $negative_duration $THRESHOLD
    ) $status -eq $FAIL
end
