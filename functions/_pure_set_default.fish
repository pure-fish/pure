function _pure_set_default \
    --description 'Set default value for configuration variable' \
    --argument-names var default

    if  not set --query --universal $var; or test -z $$var; and not set --query --global $var
        set --universal $var $default
    end
end
