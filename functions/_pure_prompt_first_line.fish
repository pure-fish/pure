set --global FAILURE 1

function _pure_prompt_first_line \
    --description 'Print contextual information before prompt.'

    if not type --quiet --no-functions git  # exit if git is not available
        return $FAILURE
    end

    set --local prompt_ssh (_pure_prompt_ssh)
    set --local prompt_container (_pure_prompt_container)
    set --local prompt_git (_pure_prompt_git)
    set --local prompt_command_duration (_pure_prompt_command_duration)
    set --local prompt (_pure_print_prompt \
                            $prompt_ssh \
                            $prompt_container \
                            $prompt_git \
                            $prompt_command_duration
                        )
    set --local prompt_width (_pure_string_width $prompt)
    set --local current_folder (_pure_prompt_current_folder $prompt_width)

    set --local prompt_components
    if set --query pure_begin_prompt_with_current_directory; and test "$pure_begin_prompt_with_current_directory" = true
        set prompt_components \
                $current_folder \
                $prompt_git \
                $prompt_ssh \
                $prompt_container \
                $prompt_command_duration
    else
        set prompt_components \
                $prompt_ssh \
                $prompt_container \
                $current_folder \
                $prompt_git \
                $prompt_command_duration
    end

    echo (_pure_print_prompt $prompt_components)
end
