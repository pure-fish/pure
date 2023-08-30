source (status dirname)/fixtures/constants.fish
@echo (_print_filename (status filename))


function before_all
    # tests/fixtures/ permissions are o=rwx /!\
    cp tests/fixtures/{config.mock.fish,config.fish}
end
before_all

function after_all
    rm tests/fixtures/config.fish
end


@test "migrate all variables" (
    set file_to_migrate (status dirname)/fixtures/config.mock.fish  # created during 'before_all'

    fish (status dirname)/../tools/migration-to-4.0.0.fish $file_to_migrate 2>&1 >/dev/null

    diff -U $NONE (status dirname)/fixtures/config.expected.fish $file_to_migrate
) $status -eq $SUCCESS


after_all
