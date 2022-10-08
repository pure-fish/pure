function _pure_is_inside_container \
    --argument-names cgroup_namespace
    set --query cgroup_namespace[1]; or set cgroup_namespace /proc/1/cgroup

    set --local success 0
    if test -n "$container"
        return $success
    end

    set --local os_name (uname -s)
    if test $os_name = Linux
        if _pure_detect_container_by_pid_method
            return $success
        end

        if _pure_detect_container_by_cgroup_method $cgroup_namespace
            return $success
        end
    end

    set --local failure 1
    return $failure
end
