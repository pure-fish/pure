function _pure_set_color \
    --description 'Set color' \
    --argument-names var default

    set --local color $default
    if set -q $var
        set color $$var
    end

    set --local result (set_color $color)
    echo "$result"
end
