function _clean_mock \
    --description "Clean a mock function (warning: erase the function)" \
    --argument-names \
    function_name

    functions --erase $function_name
end

function _clean_all_mocks \
    --description "Clean all mock function"

    for function_name in $__mocks
        if functions --query $function_name
            functions --erase $function_name
        end

        if functions --query __backup_$function_name # restore original function
            functions --copy __backup_$function_name $function_name
            functions --erase __backup_$function_name
        end
    end
    set --global __mocks # clear mocks
end

function _clean_all_spy_calls \
    --description "Clean all spy calls created by `_spy`"
    for mock_call in /tmp/*.mock_calls
        if test -r $mock_call
            rm -f $mock_call
        end
    end
    # Note: Function restoration is handled by _clean_all_mocks via __backup_*
    # The _spy function uses _backup_before_mocking which creates __backup_* functions
end

function _pure_unmock \
    --description "Restore a pure function by reloading its source" \
    --argument-names \
    function_name

    source (status dirname)/../../functions/$function_name.fish
end
