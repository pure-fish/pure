function _clean_mock \
    --description "Clean a mock function (warning: erase the function)" \
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

function _clean_all_spy_calls \
    --description "Clean all spy calls created by `_spy`"
    for mock_calls in /tmp/*.mock_calls
        if test -r $mock_calls
            rm -f $mock_calls
        end
    end
end

function _pure_unmock \
    --description "Restore a pure function by reloading its source" \
    --argument-names \
    function_name

    source (status dirname)/../../functions/$function_name.fish
end
