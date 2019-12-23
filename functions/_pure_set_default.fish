function _pure_set_default \
    --description 'Set default value for configuration variable' \
    --argument-names var default

    if not set -q --universal $var; or test -z $$var
        set --universal $var $default
    end
end
