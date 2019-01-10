source $DIRNAME/../fish_title.fish
source $DIRNAME/../tools/versions-compare.fish

function setup
    mkdir --parents /tmp/current/directory/
    cd /tmp/current/directory/

    function _pure_parse_directory; echo /tmp/current/directory; end
end

if fish_version_below '3.0.0'
test "fish_title: contains current directory and previous command"
    (
        set pure_symbol_horizontal_bar '—'
        fish_title 'last-command' 
    ) = "directory: last-command — "
end
end

if fish_version_at_least '3.0.0'
test "fish_title: contains current directory and previous command"
    (
        set pure_symbol_horizontal_bar '—'
        fish_title 'last-command' 
    ) = "directory: last-command — fish"
end
end

if fish_version_below '3.0.0'
test "fish_title: contains current directory with *empty* a previous command"
    (
        fish_title '' 
    ) = "/tmp/current/directory — "
end
end

if fish_version_at_least '3.0.0'
test "fish_title: contains current directory with an *empty* previous command"
    (
        fish_title '' 
    ) = "/tmp/current/directory — fish"
end
end

if fish_version_below '3.0.0'
test "fish_title: contains current path without a previous command"
    (
        set pure_symbol_horizontal_bar '—'
        fish_title
    ) = "/tmp/current/directory — "
end
end

if fish_version_at_least '3.0.0'
test "fish_title: contains current path without a previous command"
    (
        set pure_symbol_horizontal_bar '—'
        fish_title
    ) = "/tmp/current/directory — fish"
end
end

function teardown
    functions --erase _pure_parse_directory
end
