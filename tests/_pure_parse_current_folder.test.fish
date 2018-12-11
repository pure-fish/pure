source $DIRNAME/../functions/__parse_current_folder.fish

set --local EMPTY ''

test "returns current directory"
    (
        __parse_current_folder
    ) = $PWD
end

test 'replaces $HOME by ~'
    (
        pushd $HOME

        __parse_current_folder
        popd
    ) = '~'
end

test 'shortens directory in prompt'
    (
        string length (__parse_current_folder 1)
    ) -lt (string length $PWD)
end
