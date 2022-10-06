source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/../functions/_pure_detect_container_by_cgroup_method.fish
@echo (_print_filename (status filename))


function setup
    _purge_configs
    _disable_colors

    set --global cgroup_namespace /tmp/proc/1/cgroup
    set --global namespace (dirname $cgroup_namespace)
    mkdir -p $namespace; and touch $cgroup_namespace
end
setup

function teardown
    rm -rf \
        $namespace \
        $cgroup_namespace
    set --erase cgroup_namespace
    set --erase namespace
end

if test (uname -s) = "Linux"
@test "_pure_detect_container_by_cgroup_method: false for host OS" (
    echo "1:name=systemd:/init.scope" > $cgroup_namespace
    set --global container $EMPTY

    _pure_detect_container_by_cgroup_method $cgroup_namespace
) $status -eq $FAILURE
end

if test (uname -s) = "Linux"
@test "_pure_detect_container_by_cgroup_method: true for Docker's container" (
    echo "1:name=systemd:/docker/54c541…af18c609c" > $cgroup_namespace

    _pure_detect_container_by_cgroup_method $cgroup_namespace
) $status -eq $SUCCESS
end

if test (uname -s) = "Linux"
@test "_pure_detect_container_by_cgroup_method: true for LXC/LXD's container (using namespace detail)" (
    echo "1:name=systemd:/lxc/54c541…af18c609c" > $cgroup_namespace

    _pure_detect_container_by_cgroup_method $cgroup_namespace
) $status -eq $SUCCESS
end

if test (uname -s) = "Linux"
@test "_pure_detect_container_by_cgroup_method: true for LXC/LXD's container (using environment variable)" (
    set --global container 'lxc'

    _pure_detect_container_by_cgroup_method $cgroup_namespace
) $status -eq $SUCCESS
end

teardown
