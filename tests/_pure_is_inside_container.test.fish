source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_is_inside_container.fish
source (status dirname)/../functions/_pure_detect_container_by_pid_method.fish
source (status dirname)/../functions/_pure_detect_container_by_cgroup_method.fish
# @echo (_print_filename (status filename))


# echo "SYSTEM CONTAINER: $container"
function before_all
    _purge_configs
    _disable_colors

    set --global cgroup_namespace /tmp/proc/1/cgroup
    set --global namespace (dirname $cgroup_namespace)
    mkdir -p $namespace; and touch $cgroup_namespace
end
before_all

function before_each
    set --global container ""
    _clean_all_mocks
    _clean_all_spy_calls
end

function after_all
    rm -rf \
        $namespace \
        $cgroup_namespace
    set --erase cgroup_namespace
    set --erase namespace
    set --erase called
end

before_each
@test "pure_enable_container_detection: feature is disabled" (
    set --universal pure_enable_container_detection false
    _spy_response uname "fake-os"

    _pure_is_inside_container

    _has_called uname # should NOT be called
) $status -eq $FAILURE

before_each
@test "pure_enable_container_detection: feature is enabled" (
    set --universal pure_enable_container_detection true
    _spy_response uname "fake-os"

    _pure_is_inside_container

    _has_called uname # should be called
) $status -eq $SUCCESS

before_each
if test (command uname -s) != Darwin # non-macOS
    @test "_pure_is_inside_container: true for Github Action on Ubuntu" (
        set --universal pure_enable_container_detection true

        _pure_is_inside_container
    ) $status -eq $SUCCESS
end

before_each
if test (command uname -s) = Darwin # macos
    @test "_pure_is_inside_container: false for Github Action on MacOS" (
        set --universal pure_enable_container_detection true

        _pure_is_inside_container
    ) $status -eq $FAILURE
end

before_each
@test "_pure_is_inside_container: detect with $container variable" (
    set --universal pure_enable_container_detection true
    set --global container "fake"

    _pure_is_inside_container
) $status -eq $SUCCESS

before_each
@test "_pure_is_inside_container: returns false as default behavior" (
    set --universal pure_enable_container_detection false

    _pure_is_inside_container
) $status -eq $FAILURE

before_each
if test (command uname -s) = Linux
    @test "_pure_is_inside_container: detect with pid method" (
        set --universal pure_enable_container_detection true
        _mock_exit_status _pure_detect_container_by_cgroup_method $FAILURE
        _spy _pure_detect_container_by_pid_method

        _pure_is_inside_container

        _has_called _pure_detect_container_by_pid_method
    ) $status -eq $SUCCESS
end

before_each
if test (command uname -s) = Linux
    @test "_pure_is_inside_container: detect with cgroup method" (
        set --universal pure_enable_container_detection true
        _spy _pure_detect_container_by_cgroup_method

        _pure_is_inside_container
        _has_called _pure_detect_container_by_cgroup_method
    ) $status -eq $SUCCESS
end


after_all
