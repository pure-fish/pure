function _pure_set_color \
    --description 'Set color' \
    --argument-names var

    set --local color $var
    # Backwards compatibility for colors defined as control sequencies instead of fish colors
    if not string match --quiet --all --regex '\e\[[^m]*m' $color[1]
        and set -q $color
            set color $$var
    end

    set --local result $color
    if not string match --quiet --all --regex '\e\[[^m]*m' $result[1]
        and not test -z $result[1]
            set result (set_color $color)
    end

    echo "$result"
end
