function _pure_prompt_current_folder
    set --local current_folder (_pure_parse_directory (math $COLUMNS - $argv[1] - 1))
    set --local current_folder_color "$pure_color_blue"

    echo "$current_folder_color$current_folder"
end
