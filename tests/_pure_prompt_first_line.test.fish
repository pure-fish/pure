source $DIRNAME/../functions/_pure_prompt_first_line.fish

set --local EMPTY ''

test "fails when git is missing"
    (
        functions --copy type builtin_type
        function type  # mock, see https://github.com/fish-shell/fish-shell/issues/5444
            if test "x$argv" = "x-fq git"
                return 1
            end
            builtin_type $argv
        end

        _pure_prompt_first_line
        set --local exit_code $status
        
        functions --erase type  # remove mock
        functions --copy builtin_type type  # restore built-in behavior for following test cases
        echo $exit_code
    ) = 1
end

test "print first line as: current directory, git, user@hostname, command duration"
    (
        set pure_color_blue $EMPTY
        set pure_color_gray $EMPTY
        set pure_color_yellow $EMPTY

        mkdir --parents /tmp/test
        cd /tmp/test
        git init --quiet
        set CMD_DURATION 1000 # in milliseconds
        set pure_command_max_exec_time 0 # in seconds
        set SSH_CONNECTION 127.0.0.1 56422 127.0.0.1 22
        function _pure_prompt_user_and_host
            echo 'user@hostname'
        end

        set pure_user_host_location 0
        _pure_prompt_first_line

        rm --recursive --force /tmp/test
    ) = '/tmp/test master user@hostname 1s'
end

test "print first line as: user@hostname, current directory, git, command duration"
    (
        set pure_color_blue $EMPTY
        set pure_color_gray $EMPTY
        set pure_color_yellow $EMPTY

        mkdir --parents /tmp/test
        cd /tmp/test
        git init --quiet
        set CMD_DURATION 1000 # in milliseconds
        set pure_command_max_exec_time 0 # in seconds
        set SSH_CONNECTION 127.0.0.1 56422 127.0.0.1 22
        function _pure_prompt_user_and_host
            echo 'user@hostname'
        end

        set pure_user_host_location 1
        _pure_prompt_first_line

        rm --recursive --force /tmp/test
    ) = 'user@hostname /tmp/test master 1s'
end
