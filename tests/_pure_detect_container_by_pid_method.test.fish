source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/../functions/_pure_detect_container_by_pid_method.fish
@echo (_print_filename (status filename))


function setup
    _purge_configs
    _disable_colors
end
setup

function teardown
    functions --erase uname
end

set proc_sched /tmp/1/sched
function before_each
    functions --erase head
end

function _create_proc_sched_file --argument-names proc_sched
    mkdir -p (dirname $proc_sched)
    touch $proc_sched
end

before_each
@test "_pure_detect_container_by_pid_method: ignored when /proc/*/scheg is missing" (
    rm -rf $proc_sched
    function head; echo (status function) > /tmp/called; end # spy

    _pure_detect_container_by_pid_method $proc_sched
    _has_called head
) $status -eq $FAILURE


before_each
@test "_pure_detect_container_by_pid_method: when /proc/*/scheg exists" (
    _create_proc_sched_file $proc_sched
    function head; echo (status function) > /tmp/called; end # spy

    _pure_detect_container_by_pid_method $proc_sched
    _has_called head
) $status -eq $SUCCESS


if test (uname -s) = Linux
    _create_proc_sched_file $proc_sched
    before_each
    @test "_pure_detect_container_by_pid_method: false when detecting init in /proc/1/sched" (
        echo "init (1, #threads: 1)" >$proc_sched

        _pure_detect_container_by_pid_method $proc_sched
    ) $status -eq $FAILURE
end

if test (uname -s) = Linux
    before_each
    @test "_pure_detect_container_by_pid_method: false when detecting systemd in /proc/1/sched" (
        _create_proc_sched_file $proc_sched
        echo "systemd (1, #threads: 1)" >$proc_sched

        _pure_detect_container_by_pid_method $proc_sched
    ) $status -eq $FAILURE
end

if test (uname -s) = Linux
    before_each
    @test "_pure_detect_container_by_pid_method: true when 1st process is neither systemd nor init in /proc/1/sched" (
        _create_proc_sched_file $proc_sched
        echo "fish (1, #threads: 1)" >$proc_sched

        _pure_detect_container_by_pid_method $proc_sched
    ) $status -eq $SUCCESS
end

# teardown
