function _mock \
    --description "Invoke a mock function located in tests/mocks/" \
    --argument-names \
    function_name # name of the method to mock

    set mock_filepath (status dirname)/$function_name.mock.fish
    if test -e $mock_filepath
        source (status dirname)/$function_name.mock.fish
        set --global --append __mocks $function_name
    end
end

function backup \
    --description "Backup a function by copying to prefixed function" \
    --argument-names \
    function_name

    if functions --query $function_name
        functions --erase __backup_$function_name # force overwrite
        functions --copy $function_name __backup_$function_name
        functions --erase $function_name
    end
end

function _mock_response \
    --description "Mock a response for a mock function" \
    --argument-names \
    function_name \
    response # response to return

    echo "$response" >/tmp/$function_name.mock_response
    backup $function_name

    # redefine function to return mock response
    function $function_name \
        --description "Mocking $function_name response" \
        --argument-names mock_reponse
        echo (status current-function) >/tmp/(status current-function).mock_calls
        return (command cat /tmp/(status current-function).mock_response)
    end
    set --global --append __mocks $function_name
    set --global --append __mocks_backup __backup_$function_name
end


function _clean_mock \
    --description "Clean a mock function" \
    --argument-names \
    function_name

    functions --erase $function_name
end

function _clean_all_mocks \
    --description "Clean all mock function"

    for mock in $__mocks
        if functions --query $mock
            functions --erase $mock
        end

        if functions --query __backup_$function_name # restore original function
            functions --copy __backup_$function_name $function_name
            functions --erase __backup_$function_name
        end
    end
    set --global __mocks # clear mocks
end

function _spy \
    --description "Create a spy around method" \
    --argument-names \
    function_name # name of the method to spy

    backup $function_name

    function $function_name
        echo (status current-function) >/tmp/(status current-function).mock_calls
    end # spy
end


function _cleanup_spy_calls
    for mock_calls in /tmp/*.mock_calls
        if test -r $mock_calls
            rm -f $mock_calls
        end
    end
end

function _has_called \
    --description "check spy method XYZ write to the /tmp/$function_name.mock_calls file when called" \
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

function _pure_unmock \
    --description "Restore a pure function by reloading its source" \
    --argument-names \
    function_name

    source (status dirname)/../../functions/$function_name.fish
end
