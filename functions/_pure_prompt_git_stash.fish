function _pure_prompt_git_stash
    set --local git_stash_symbol
    set --local git_stash_color
    set --local git_stash_number

    set --local git_stash_count (
        command git rev-list --walk-reflogs --count refs/stash 2> /dev/null
        or echo "0"
    )
    if test "$git_stash_count" -gt 0 # has git stash
        set git_stash_symbol " $pure_symbol_git_stash"
        set git_stash_color (_pure_set_color $pure_color_git_stash)
        if test "$pure_show_numbered_git_indicator" = true
            set git_stash_number "$git_stash_count"
        end
    end

    echo "$git_stash_color$git_stash_symbol$git_stash_number"
end
