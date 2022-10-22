function fish_title \
    --description "Set title to current folder and shell name" \
    --argument-names last_command

    set --local current_folder (fish_prompt_pwd_dir_length=$pure_shorten_window_title_current_directory_length prompt_pwd)
    set --local current_command (status current-command 2>/dev/null; or echo $_)

    set --local prompt "$current_folder: $last_command $pure_symbol_title_bar_separator $current_command"

    if test -z "$last_command"
        set prompt "$current_folder $pure_symbol_title_bar_separator $current_command"
    end

    echo $prompt
end
