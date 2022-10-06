source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/../functions/_pure_is_inside_container.fish
source (dirname (status filename))/../functions/_pure_detect_container_by_pid_method.fish
source (dirname (status filename))/../functions/_pure_detect_container_by_cgroup_method.fish
@echo (_print_filename (status filename))


# echo "SYSTEM CONTAINER: $container"
function setup
    _purge_configs
    _disable_colors

    set --global cgroup_namespace /tmp/proc/1/cgroup
    set --global namespace (dirname $cgroup_namespace)
    mkdir -p $namespace; and touch $cgroup_namespace
end
setup

function before_each
    functions --erase _pure_detect_container_by_pid_method
    functions --erase _pure_detect_container_by_cgroup_method
    functions --erase  uname
end

function teardown
    rm -rf \
        $namespace \
        $cgroup_namespace
    set --erase cgroup_namespace
    set --erase namespace
end

@test "_pure_is_inside_container: true for Github Action" (
    _pure_is_inside_container
) $status -eq $SUCCESS

if test (uname -s) = "Linux"
before_each
@test "_pure_is_inside_container: detect with pid method" (
function _pure_detect_container_by_pid_method; echo "called: "(status function); end # spy

_pure_is_inside_container
) = "called: _pure_detect_container_by_pid_method"
end

if test (uname -s) = "Linux"
before_each
@test "_pure_is_inside_container: detect with cgroup method" (
    function _pure_detect_container_by_pid_method; false; end # spy
    function _pure_detect_container_by_cgroup_method; echo "called: "(status function); end # spy

    _pure_is_inside_container
) = "called: _pure_detect_container_by_cgroup_method"
end


teardown
