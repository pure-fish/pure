source (status dirname)/../tests/fixtures/constants.fish

function fish_version_below \
    --description "Compare versions.  By default this tests \$FISH_VERSION, but if a second argument is provided it tests against that version." \
    --argument-names \
    expected \
    actual

    test -z "$actual" && set actual $FISH_VERSION

    if test "$expected" = $actual
        return $FAILURE
    end

    # busybox compatibility (see https://github.com/fish-shell/fish-shell/issues/4419#issuecomment-453512461)
    printf '%s\n' $actual $expected \
        | sort -c -t. -k 1,1n -k 2,2n -k 3,3n 2>/dev/null

    return $status
end

function fish_version_at_least \
    --description "Compare versions.  By default this tests \$FISH_VERSION, but if a second argument is provided it tests against that version." \
    --argument-names \
    expected \
    actual

    function skip_message --argument-names expected
        @echo (set_color yellow)"skip, "(set_color normal)(print_fish_version_at_least $expected)
    end

    if fish_version_below $expected $actual >/dev/null
        skip_message $expected
        return $FAILURE
    end
    return $SUCCESS
end

function print_fish_version_below \
    --argument-names \
    expected \
    actual

    test -z "$actual" && set actual $FISH_VERSION

    printf "requires Fish <%s, got %s%s%s" (set_color yellow) $expected (set_color red) $actual (set_color normal)
end

function print_fish_version_at_least \
    --argument-names \
    expected \
    actual

    test -z "$actual" && set actual $FISH_VERSION

    printf "requires Fish ≥%s, got %s%s%s" $expected (set_color red) $actual (set_color normal)
end
