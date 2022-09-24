source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/../functions/_pure_is_inside_container.fish
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

function teardown
    rm -rf \
        $namespace \
        $cgroup_namespace
    set --erase cgroup_namespace
    set --erase namespace
end

@test "_pure_is_inside_container: true for Github Action" ( # docker >=v20?
    _pure_is_inside_container
) $status -eq $SUCCESS


teardown
