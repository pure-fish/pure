source $DIRNAME/../fish_title.fish

function setup
    mkdir --parents /tmp/current/directory/
    cd /tmp/current/directory/

    function _pure_parse_directory; echo /tmp/current/directory; end
end

test "fish_title: contains current directory and previous command"
    (
        fish_title 'last-command' 
    ) = "directory: last-command — "
end

test "fish_title: contains current directory with *empty* a previous command"
    (
        fish_title '' 
    ) = "/tmp/current/directory — "
end

test "fish_title: contains current path without a previous command"
    (
        fish_title
    ) = "/tmp/current/directory — "
end

function teardown
    functions --erase _pure_parse_directory
 end
