source $DIRNAME/../functions/_pure_parse_directory.fish

set --local empty ''

test "returns current directory"
    (
        mkdir --parents /tmp/current/directory/
        cd /tmp/current/directory/
        
        _pure_parse_directory
    ) = $PWD
end

test 'replaces $HOME by ~'
    (
        pushd $HOME

        _pure_parse_directory
        popd
    ) = '~'
end

test 'shortens directory in prompt'
    (
        string length (_pure_parse_directory 1)
    ) -lt (string length $PWD)
end
