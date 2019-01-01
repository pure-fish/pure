# Set title to current folder and shell name
function fish_title
    set --local basename (string replace -r '^.*/' '' -- $PWD)
    set --local current_folder (_pure_parse_directory)
    set --local command $argv[1]
    set --local prompt "$basename: $command $pure_symbol_horizontal_bar $_"

    if test -z "$command"
        set prompt "$current_folder $pure_symbol_horizontal_bar $_"
    end

    echo $prompt
end
