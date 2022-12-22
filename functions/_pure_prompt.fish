function _pure_prompt \
    --description 'Print prompt symbol' \
    --argument-names exit_code

    set --local jobs (_pure_prompt_jobs)
    set --local nixdevshell (_pure_prompt_nixdevshell) # Nix build environment indicator
    set --local virtualenv (_pure_prompt_virtualenv) # Python virtualenv name
    set --local aws_profile (_pure_prompt_aws_profile) # AWS profile name
    set --local vimode_indicator (_pure_prompt_vimode) # vi-mode indicator
    set --local pure_symbol (_pure_prompt_symbol $exit_code)
    set --local system_time (_pure_prompt_system_time)
    set --local root_prefix (_pure_prefix_root_prompt)
    set --local space

    if _pure_is_single_line_prompt
        set space ' '
    end

    echo (\
        _pure_print_prompt \
        $space \
        $system_time \
        $root_prefix \
        $jobs \
        $nixdevshell \
        $virtualenv \
        $aws_profile \
        $vimode_indicator \
        $pure_symbol \
    )
end
