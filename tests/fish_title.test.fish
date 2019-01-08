source $DIRNAME/../fish_title.fish

function setup
    mkdir --parents /tmp/current/directory/
    cd /tmp/current/directory/

    function _pure_parse_directory; echo /tmp/current/directory; end
end

test "fish_title: contains current directory and previous command"
    (
        set pure_symbol_horizontal_bar '—'

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
        set pure_symbol_horizontal_bar '—'
        
        fish_title
    ) = "/tmp/current/directory — "
end

test "fish_title: support fish 2.x"  # how to test $_ ?
    (
        set pure_symbol_horizontal_bar '—'
        
        fish_title
    ) = "/tmp/current/directory — "
end

test "fish_title: support fish 3.x"
    (
        function status; echo 'fishtape'; end  # mock: status current-command
        set pure_symbol_horizontal_bar '—'
        
        fish_title
    ) = "/tmp/current/directory — fishtape"
end

function teardown
    functions --erase _pure_parse_directory
 end
