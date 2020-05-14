function _pure_prompt_git_stash
    set --local git_stash_symbol
    set --local git_stash_color

    set --local is_git_stash (
        # Check if stashed files in a repo.
        command git rev-list --walk-reflogs --count refs/stash >/dev/null 2>&1
        and echo "true"
    )
    if test -n "$is_git_stash" # untracked or un-commited files
        set git_stash_symbol "$pure_symbol_git_stash"
        set git_stash_color (_pure_set_color $pure_color_git_stash)
    end

    echo "$git_stash_color$git_stash_symbol"
end
