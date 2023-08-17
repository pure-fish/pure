function _mock \
    --description "Invoke a mock function located in tests/mocks/" \
    --argument-names \
    function_name # name of the method to mock

    set mock_filepath (dirname (status filename))/$function_name.mock.fish
    if test -e $mock_filepath
        source (dirname (status filename))/$function_name.mock.fish
        set --global --append __mocks $function_name
    end
end


function _clean_mock \
    --description "Clean a mock function" \
    --argument-names \
    function_name

    functions --erase $function_name
end

function _clean_all_mocks \
    --description "Clean all mock function"
    set --local new_mocks
    for mock in $__mocks
        if functions --query $mock
            functions --erase $mock
        end
    end
    set --global __mocks
end

function _spy \
    --description "Create a spy around method" \
    --argument-names \
    function_name # name of the method to spy

    function $function_name
        echo (status function) >/tmp/called
    end # spy
end


function _cleanup_spy_calls
    if test -r /tmp/called
        rm /tmp/called
    end
end

function _has_called \
    --description "check spy method XYZ write to the /tmp/called file when called" \
    --argument-names spy # name of the method

    if test -r /tmp/called
        grep -c -q "$spy" /tmp/called \
            || printf "DEBUG: %s: received: `%s` expected: `%s`\n\n" (status function) (cat /tmp/called) $spy # check spy was called
    else
        return $FAILURE
    end
end
