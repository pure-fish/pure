source $current_dirname/fixtures/constants.fish

@test "init: source uninstall handler"  (
    functions --erase _pure_uninstall
    source $current_dirname/../functions/_pure_uninstall.fish
    functions --query _pure_uninstall
) $status -eq $SUCCESS
