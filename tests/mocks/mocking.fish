function _mock \
    --description "Mock a function using the mock in `tests/mocks/`" \
    --argument-names \
    function_name # name of the method to mock

    set mock_filepath $SPECTRA_MOCKS_DIRECTORY/$function_name.mock.fish
    if test -e $mock_filepath
        source $SPECTRA_MOCKS_DIRECTORY/$function_name.mock.fish
        set --global --append __mocks $function_name
    end
end

function _backup_before_mocking \
    --description "Backup a function by copying to prefixed function" \
    --argument-names \
    function_name

    if functions --query $function_name
        functions --erase __backup_$function_name # force overwrite
        functions --copy $function_name __backup_$function_name
        functions --erase $function_name
    end
end

function _mock_exit_status \
    --description "Mock a response exit status for a mock function" \
    --argument-names \
    function_name \
    status_code # response to return

    echo $status_code >/tmp/$function_name.mock_status_code
    _backup_before_mocking $function_name

    # redefine function to return mock status_code
    function $function_name \
        --description "Mocking $function_name with exit code="$status_code \
        --argument-names status_code
        echo (status current-function) >/tmp/(status current-function).mock_calls
        return (command cat /tmp/(status current-function).mock_status_code)
    end
    set --global --append __mocks $function_name
    set --global --append __mocks_backup __backup_$function_nameend
end

function _mock_response \
    --description "Mock a response for a mock function" \
    --argument-names \
    function_name \
    response # response to return

    echo "$response" >/tmp/$function_name.mock_response
    _backup_before_mocking $function_name

    # redefine function to return mock response
    function $function_name \
        --description "Mocking $function_name response" \
        --argument-names mock_reponse
        echo (status current-function) >/tmp/(status current-function).mock_calls
        command cat /tmp/(status current-function).mock_response
    end
    set --global --append __mocks $function_name
    set --global --append __mocks_backup __backup_$function_name
end
