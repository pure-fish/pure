function _pure_prompt_first_line \
    --description 'Print contextual information before prompt.'
    
    if not type -fq git  # exit if git is not available
        return 1
    end

    set --local prompt (_pure_print_prompt \
                            (_pure_prompt_user_and_host) \
                            (_pure_prompt_git) \
                            (_pure_prompt_command_duration)
                        )
    set --local prompt_width (_pure_string_width $prompt)
    set --local current_folder (_pure_prompt_current_folder $prompt_width)

    set --local prompt_components
    if test $pure_user_host_location -eq 0
        set prompt_components \
                (_pure_prompt_current_folder $prompt_width) \
                (_pure_prompt_git) \
                (_pure_prompt_user_and_host) \
                (_pure_prompt_command_duration)
    else
        set prompt_components \
                (_pure_prompt_user_and_host) \
                (_pure_prompt_current_folder $prompt_width) \
                (_pure_prompt_git) \
                (_pure_prompt_command_duration)
    end

    echo (_pure_print_prompt $prompt_components)
end
