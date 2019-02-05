set --global DIRNAME $DIRNAME

function setup
    cp $DIRNAME/fixtures/{config.mock.fish,config.fish}
end

function teardown
    rm $DIRNAME/fixtures/config.fish
end

test "migrate all variables"
    (
        set file_to_migrate $DIRNAME/fixtures/config.fish

        fish $DIRNAME/../tools/migration-to-2.0.0.fish $file_to_migrate 2>&1 >/dev/null
        
        diff -U 0 $DIRNAME/fixtures/config.expected.fish $file_to_migrate
    ) $status -eq 0
end
