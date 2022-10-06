function _pure_detect_container_by_cgroup_method \
    --description "Linux method to detect container using cgroup. see https://stackoverflow.com/a/37015387/802365" \
    --argument-names cgroup_namespace
    set --query cgroup_namespace[1]; or set cgroup_namespace /proc/1/cgroup

    string match \
        --quiet \
        --entire \
        --regex '(lxc|docker)' <$cgroup_namespace
end
