function _pure_detect_container_by_pid_method \
    --description "Linux method to detect container using /proc. see https://stackoverflow.com/a/37015387/802365" \
    --argument-names proc_sched

    set --query proc_sched[1]; or set proc_sched /proc/1/sched

    if test -e $proc_sched
        head -n 1 $proc_sched \
            | string match \
            --quiet \
            --invert \
            --regex 'init|systemd'
    end
end
