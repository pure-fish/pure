function _pure_check_availability \
    --description "Ensure command is available on system" \
    --argument-names \
    feature_flag \
    required_command

    set FAILURE 1

    if not type -q $required_command # command, function or alias are OK
        echo (set_color $pure_color_warning) \
            "$feature_flag feature requires: `$required_command`" \
            (set_color $pure_color_normal)
        return $FAILURE
    end
end
