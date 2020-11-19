source $current_dirname/../functions/_pure_prompt_system_time.fish

set --local success 0
function _pure_set_color; echo $empty; end # drop coloring during test

@test "_pure_prompt_system_time: no system time when disable" (
    set --global pure_show_system_time false

    _pure_prompt_system_time
) $status -eq $success

@test "_pure_prompt_system_time: displays system time when enable" (
    set --global pure_show_system_time true
    function date; /bin/date --date='10:01:29' '+%T'; end

    _pure_prompt_system_time
) = '10:01:29'
