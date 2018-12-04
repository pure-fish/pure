function __parse_current_folder -d "Replace '$HOME' with '~'"
    set --local folder (string replace $HOME '~' $PWD)
    if set -q argv[1]
        if test (string length $folder) -gt $argv[1]
            # If path exceeds maximum symbol limit, use default fish path formating function
            set folder (prompt_pwd)
        end
    end
    echo $folder
end
