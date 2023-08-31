function _spy \
    --description "Create a spy method so you can check it's been called with `_has_called`" \
    --argument-names \
    function_name # name of the method to spy

    _backup_before_mocking $function_name

    function $function_name
        echo (status current-function) >/tmp/(status current-function).mock_calls
    end # spy
end

function _has_called \
    --description "check spy method has been called, i.e has written to the /tmp/$function_name.mock_calls" \
    --argument-names \
    function_name \
    function_args # arguments to passed to the spy

    set --query function_args[1]; or set function_args $function_name # ue
    if test -r /tmp/$function_name.mock_calls
        grep -c -q "$function_args" /tmp/$function_name.mock_calls \
            || printf "DEBUG: %s: received: `%s` expected: `%s`\n\n" (status current-function) (cat /tmp/$spy.mock_calls) $spy # check spy was called
    else
        return $FAILURE
    end
end
