source (status dirname)/fixtures/constants.fish
@echo (_print_filename (status filename))

function before_each
    _purge_configs
    source ../conf.d/pure.fish
end

before_each
@test "screenshot `pure_enable_git false`" (
    set --universal pure_enable_git false
    screenshot "pure_enable_git=false"
) $status -eq $SUCCESS

before_each
@test "screenshot `pure_enable_git true `" (
    set --universal pure_enable_git true
    screenshot "pure_enable_git=true"
) $status -eq $SUCCESS

before_each
@test "screenshot `pure_enable_k8s false`" (
    set --universal pure_enable_k8s false
    screenshot "pure_enable_k8s=false"
) $status -eq $SUCCESS

before_each
@test "screenshot `pure_enable_k8s true `" (
    set --universal pure_enable_k8s true
    screenshot "pure_enable_k8s=true"
) $status -eq $SUCCESS

before_each
@test "screenshot `pure_enable_container_detection false`" (
    set --universal pure_enable_container_detection false
    screenshot "pure_enable_container_detection=false"
) $status -eq $SUCCESS

before_each
@test "screenshot `pure_enable_container_detection true `" (
    set --universal pure_enable_container_detection true
    screenshot "pure_enable_container_detection=true"
) $status -eq $SUCCESS

before_each
@test "screenshot `pure_enable_virtualenv false`" (
    set --universal pure_enable_virtualenv false
    screenshot "pure_enable_virtualenv=false"
) $status -eq $SUCCESS

before_each
@test "screenshot `pure_enable_virtualenv true `" (
    set --universal pure_enable_virtualenv true
    screenshot "pure_enable_virtualenv=true"
) $status -eq $SUCCESS

before_each
@test "screenshot `pure_enable_single_line_prompt false`" (
    set --universal pure_enable_single_line_prompt false
    screenshot "pure_enable_single_line_prompt=false"
) $status -eq $SUCCESS

before_each
@test "screenshot `pure_enable_single_line_prompt true `" (
    set --universal pure_enable_single_line_prompt true
    screenshot "pure_enable_single_line_prompt=true"
) $status -eq $SUCCESS
