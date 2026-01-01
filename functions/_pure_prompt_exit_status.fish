function _pure_prompt_exit_status \
    --description 'Print list of exit statuses if last command failed'

    if set --query pure_show_exit_status;
        and test "$pure_show_exit_status" = true

        set --local status_color (_pure_set_color $pure_color_exit_status)
        set --local command_succeed 0

        if test $argv[-1] -ne $command_succeed # print only if last status is non-zero
            set --local status_text (string join "$pure_symbol_exit_status_separator" $argv)
            echo "$status_color$status_text"
        end
    end
end
