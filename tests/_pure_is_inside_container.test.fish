source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_is_inside_container.fish
source (status dirname)/../functions/_pure_detect_container_by_pid_method.fish
source (status dirname)/../functions/_pure_detect_container_by_cgroup_method.fish
@echo (_print_filename (status filename))


# echo "SYSTEM CONTAINER: $container"
function before_all
    _purge_configs
    _disable_colors

    set --global cgroup_namespace /tmp/proc/1/cgroup
    set --global namespace (dirname $cgroup_namespace)
    mkdir -p $namespace; and touch $cgroup_namespace
end
before_all

function cleanup_detection_methods
    functions --erase _pure_detect_container_by_pid_method
    functions --erase _pure_detect_container_by_cgroup_method
    set --global container ""
end

function cleanup_spy
    functions --erase uname
end

function after_all
    rm -rf \
        $namespace \
        $cgroup_namespace
    set --erase cgroup_namespace
    set --erase namespace
    set --erase called
end

@test "pure_enable_container_detection: feature is disabled" (
    set --universal pure_enable_container_detection false
    set --universal called "never"
    function uname; set called once; echo "fake-os" ; end # spy

    _pure_is_inside_container
    echo $called
) = never

@test "pure_enable_container_detection: feature is enabled" (
    set --universal pure_enable_container_detection true
    set --universal called "never"
    function uname; set called once; echo "fake-os" ; end # spy

    _pure_is_inside_container
    echo $called
) = once

cleanup_spy
@test "_pure_is_inside_container: true for Github Action" (
    set --universal pure_enable_container_detection true

    _pure_is_inside_container
) $status -eq $SUCCESS

@test "_pure_is_inside_container: detect with $container variable" (
    set --universal pure_enable_container_detection true
    set --global container "fake"

    _pure_is_inside_container
) $status -eq $SUCCESS

@test "_pure_is_inside_container: returns false as default behavior" (
    set --universal pure_enable_container_detection false

    _pure_is_inside_container
) $status -eq $FAILURE

cleanup_detection_methods
if test (uname -s) = Linux
    @test "_pure_is_inside_container: detect with pid method" (
        set --universal pure_enable_container_detection true
        function _pure_detect_container_by_cgroup_method; false; end # spy
        function _pure_detect_container_by_pid_method; echo "called: "(status current-function); end # spy

        _pure_is_inside_container
    ) = "called: _pure_detect_container_by_pid_method"
end

cleanup_detection_methods
if test (uname -s) = Linux
    @test "_pure_is_inside_container: detect with cgroup method" (
        set --universal pure_enable_container_detection true
        function _pure_detect_container_by_cgroup_method; echo "called: "(status current-function); end # spy

        _pure_is_inside_container
    ) = "called: _pure_detect_container_by_cgroup_method"
end


after_all
