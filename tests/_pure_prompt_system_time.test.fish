source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_system_time.fish
@echo (_print_filename (status filename))


function before_all
    _purge_configs
    _disable_colors
end
before_all


@test "_pure_prompt_system_time: no system time when disable" (
    set --universal pure_show_system_time false

    _pure_prompt_system_time
) $status -eq $SUCCESS

@test "_pure_prompt_system_time: displays system time when enable" (
    set --universal pure_show_system_time true
    function date
        test (uname) = Darwin;
        and command date -j -f "%H:%M:%S" '10:01:29' '+%T'; # MacOS
        or command date -d '10:01:29' '+%T'; # Linux
    end

    _pure_prompt_system_time
) = '10:01:29'
