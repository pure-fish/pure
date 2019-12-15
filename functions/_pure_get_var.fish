function _pure_get_var \
    --description 'Get value of configuration variable' \
    --argument-names var default

    set --local result $default
    if set -q $var
        set result $$var
    end

    echo "$result"
end
