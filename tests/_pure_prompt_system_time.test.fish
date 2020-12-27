source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_system_time.fish


function _pure_set_color; echo $EMPTY; end # drop coloring during test

@test "_pure_prompt_system_time: no system time when disable" (
    set --global pure_show_system_time false

    _pure_prompt_system_time
) $status -eq $SUCCESS

@test "_pure_prompt_system_time: displays system time when enable" (
    set --global pure_show_system_time true
    function date
        test (uname) = Darwin;
        and command date -j -f "%H:%M:%S" '10:01:29' '+%T'; # MacOS
        or command date -d '10:01:29' '+%T'; # Linux
    end

    _pure_prompt_system_time
) = '10:01:29'
