function _pure_prompt_exit_status \
    --description 'Print list of exit statuses if last command failed'

    if set --query pure_show_exit_status;
        and test "$pure_show_exit_status" = true

        set --local status_color (_pure_set_color $pure_color_exit_status)
        set --local command_succeed 0
        set --local last_status $argv[-1]

        if test $last_status -ne $command_succeed # print only if last status is non-zero
            set --local status_text ""
            if set --query pure_convert_exit_status_to_signal;
                and test "$pure_convert_exit_status_to_signal" = true

                for exit_code in $argv
                    if test -z "$status_text" # don't put a separator before the first code
                        set status_text (fish_status_to_signal $exit_code)
                    else
                        set status_text (string join "$pure_symbol_exit_status_separator" "$status_text" (fish_status_to_signal $exit_code))
                    end
                end
            else
                set status_text (string join "$pure_symbol_exit_status_separator" $argv)
            end

            echo "$status_color$pure_symbol_exit_status_prefix$status_text"
        end
    end
end
