function _pure_parse_directory \
    --description "Replace '$HOME' with '~'" \
    --argument-names max_path_length

    set --local folder (fish_prompt_pwd_dir_length=$pure_shorten_prompt_current_directory_length prompt_pwd)

    if test -n "$max_path_length"
        if test (string length $folder) -gt $max_path_length
            # If path exceeds maximum symbol limit, force fish path formating function to use 1 character
            set folder (fish_prompt_pwd_dir_length=1 prompt_pwd)
        end
    end

    if test "$pure_truncate_prompt_current_directory_keeps" -ge 1
        set folder (
            string split '/' $folder \
                | tail -n $pure_truncate_prompt_current_directory_keeps \
                | string join '/'
        )
    end

    echo $folder
end
