function _pure_is_inside_container \
    --argument-names cgroup_namespace
    set --query cgroup_namespace[1]; or set cgroup_namespace /proc/1/cgroup

    begin
        test -r $cgroup_namespace
        and string match \
                --quiet \
                --entire \
                --regex '(lxc|docker)' \
            <$cgroup_namespace
    end
    or test "$container" = "lxc"
end
