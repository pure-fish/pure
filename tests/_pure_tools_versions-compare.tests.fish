source $DIRNAME/../tools/versions-compare.fish

set --local fail 1
set --local success 0

test "versions: is_lower_than_equal fail when first > second argument"
    (
        is_lower_than_equal '2.5.7' '2.5.6'
    ) $status -eq $fail
end

test "versions: is_lower_than_equal succeed when first < second argument"
    (
        is_lower_than_equal '2.5.6' '2.5.7'
    ) $status -eq $success
end

test "versions: is_lower_than succeed when first = second argument"
    (
        is_lower_than_equal '2.5.7' '2.5.7'
    ) $status -eq $success
end

test "versions: is_lower_than fail when first = second argument"
    (
        is_lower_than '2.5.7' '2.5.7'
    ) $status -eq $fail
end

test "versions: is_lower_than succeed when first < second argument"
    (
        is_lower_than '2.5.6' '2.5.7'
    ) $status -eq $success
end

test "versions: is_lower_than fail when first > second argument"
    (
        is_lower_than '2.5.7' '2.5.6'
    ) $status -eq $fail
end

test "versions: fish_version_below current version fail on itself"
    (
        fish_version_below $FISH_VERSION >/dev/null
    ) $status -eq $fail
end

test "versions: fish_version_at_least current version succeed on itself"
    (
        fish_version_at_least $FISH_VERSION >/dev/null
    ) $status -eq $success
end
