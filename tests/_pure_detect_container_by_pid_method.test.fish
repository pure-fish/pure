source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/../functions/_pure_detect_container_by_pid_method.fish
@echo (_print_filename (status filename))


function setup
    _purge_configs
    _disable_colors
end
setup

function teardown
    functions --erase  uname
end

if test (uname -s) = "Linux"
@test "_pure_detect_container_by_pid_method: true for init" (
    set --local proc_sched /proc/1/sched
    echo "init (1, #threads: 1)" >$proc_sched

    _pure_detect_container_by_pid_method $proc_sched
) $status -eq $SUCCESS
end

if test (uname -s) = "Linux"
@test "_pure_detect_container_by_pid_method: true for systemd" (
    set --local proc_sched /proc/1/sched
    echo "systemd (1, #threads: 1)" >$proc_sched

    _pure_detect_container_by_pid_method $proc_sched
) $status -eq $SUCCESS
end

if test (uname -s) = "Linux"
@test "_pure_detect_container_by_pid_method: true for Github Action" (
    set --local proc_sched /proc/1/sched
    echo "systemd (1, #threads: 1)" >$proc_sched

    _pure_detect_container_by_pid_method $proc_sched
) $status -eq $SUCCESS
end


teardown
