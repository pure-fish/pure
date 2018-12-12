function _pure_prompt_first_line
    set --local user_and_host (_pure_prompt_user_and_host)

    # Exit with code 1 if git is not available
    if not type -fq git
        return 1
    end

    set --local git_repo (_pure_prompt_git)

    set --local command_duration (_pure_prompt_command_duration)

    set --local prompt (_pure_print_prompt $user_and_host $git_repo $command_duration)

    set --local current_prompt_width (_pure_string_width $prompt)
    set --local current_folder (_pure_prompt_current_folder $current_prompt_width)

    if test $pure_user_host_location -eq 0
        echo (_pure_print_prompt $current_folder $git_repo $user_and_host $command_duration)
    else
        echo (_pure_print_prompt $user_and_host $current_folder $git_repo $command_duration)
    end
end
