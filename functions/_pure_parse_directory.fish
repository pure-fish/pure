function _pure_parse_directory \
    --description "Replace '$HOME' with '~'" \
    --argument-names max_path_length

    if not set --local root_path (_pure_prompt_git_truncate)
        set root_path $PWD
    end

    set --local display_path (fish_prompt_pwd_dir_length=$pure_shorten_prompt_current_directory_length prompt_pwd $root_path)

    if test -n "$max_path_length"
        if test (string length $display_path) -gt $max_path_length
            # If path exceeds maximum symbol limit, force fish path formating function to use 1 character
            set display_path (fish_prompt_pwd_dir_length=1 prompt_pwd $root_path)
        end
    end

    if test "$pure_truncate_prompt_current_directory_keeps" -ge 1
        set display_path (
            string split '/' $display_path \
                | tail -n $pure_truncate_prompt_current_directory_keeps \
                | string join '/'
        )
    end

    echo $display_path
end
