function _pure_set_color \
    --description 'Set color' \
    --argument-names var default

    set --local result $default
    if set -q $var
        set result $$var
    end

    echo "$result"
end
