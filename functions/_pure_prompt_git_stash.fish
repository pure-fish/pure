function _pure_prompt_git_stash
    set --local git_stash_symbol
    set --local git_stash_color

    set --local has_stashed_files (
        command git rev-list --walk-reflogs --count refs/stash >/dev/null 2>&1
        and echo "true"
    )
    if test -n "$has_stashed_files" # untracked or un-commited files
        set git_stash_symbol " $pure_symbol_git_stash"
        set git_stash_color (_pure_set_color $pure_color_git_stash)
    end

    echo "$git_stash_color$git_stash_symbol"
end
