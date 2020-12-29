source $current_dirname/fixtures/constants.fish
@mesg (print_filename $current_filename)


@test "init: source uninstall handler"  (
    functions --erase _pure_uninstall
    source $current_dirname/../conf.d/_pure_init.fish
    functions --query _pure_uninstall
) $status -eq $SUCCESS
