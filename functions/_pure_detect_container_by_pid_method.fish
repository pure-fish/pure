function _pure_detect_container_by_pid_method \
    --description "Linux method to detect container using /proc. see https://stackoverflow.com/a/37015387/802365"

    if test (uname -s) = "Darwin"; return 1; end

    set --query proc_sched[1]; or set proc_sched /proc/1/sched

    head -n 1 $proc_sched \
        | string match \
        --quiet \
        --invert \
        --regex 'init|systemd'
end
