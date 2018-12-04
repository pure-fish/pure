function __pure_pre_prompt
    set --local user_and_host (__pure_user_prompt)

    # Exit with code 1 if git is not available
    if not type -fq git
        return 1
    end
    
    set --local git_repo (__pure_git_prompt)

    set --local command_duration (__pure_command_duration_prompt)

    set --local prompt (__pure_print_prompt $user_and_host $git_repo $command_duration)

    set --local current_prompt_width (__pure_string_width $prompt)
    set --local current_folder (__pure_current_folder_prompt $current_prompt_width)

    if test $pure_user_host_location -eq 0
        echo (__pure_print_prompt $current_folder $git_repo $user_and_host $command_duration)
    else
        echo (__pure_print_prompt $user_and_host $current_folder $git_repo $command_duration)
    end
end
