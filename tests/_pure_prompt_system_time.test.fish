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

@test "_pure_prompt_system_time: displays 12hr system time when pure_system_time_format set to 12hr" (
    set --universal pure_show_system_time true
    set --universal pure_system_time_format '+%I:%M:%S %p'
    function date
        test (uname) = Darwin;
        and command date -j -f "%H:%M:%S" '22:01:29' '+%I:%M:%S %p'; # MacOS
        or command date -d '22:01:29' '+%I:%M:%S %p'; # Linux
    end

    _pure_prompt_system_time
) = '10:01:29 PM'

@test "_pure_prompt_system_time: displays 24hr system time when pure_system_time_format set to default" (
    set --universal pure_show_system_time true
    set --universal pure_system_time_format '+%T'
    function date
        test (uname) = Darwin;
        and command date -j -f "%H:%M:%S" '22:01:29' '+%T'; # MacOS
        or command date -d '22:01:29' '+%T'; # Linux
    end

    _pure_prompt_system_time
) = '22:01:29'
