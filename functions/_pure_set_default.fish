function _pure_set_default \
    --description 'Set default value for configuration variable' \
    --argument-names var default

    set is_available_universally (not set --query --universal $var; or test -z $$var; echo $status)
    set is_available_globally (not set --query --global $var; or test -z $$var; echo $status)

    if test "$is_available_universally" -eq 0 -a $is_available_globally -eq 0
        set --universal $var "$default"
    end
end
