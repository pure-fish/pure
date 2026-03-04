function _pure_prompt_git_dirty
    set --local git_dirty_symbol
    set --local git_dirty_color

    set --local is_git_dirty (
        # Single git status call that respects status.showUntrackedFiles config.
        # Set `git config status.showUntrackedFiles no` in large repos to skip
        # the expensive untracked-files scan.
        test -n "$(command git status --porcelain --ignore-submodules 2>/dev/null)"
        and echo "true"
    )
    if test -n "$is_git_dirty"  # untracked or un-commited files
        set git_dirty_symbol "$pure_symbol_git_dirty"
        set git_dirty_color (_pure_set_color $pure_color_git_dirty)
    end

    echo "$git_dirty_color$git_dirty_symbol"
end
