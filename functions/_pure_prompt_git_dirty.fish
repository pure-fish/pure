function _pure_prompt_git_dirty
    set --local git_dirty_symbol
    set --local git_dirty_color

    set --local is_git_dirty (
        # The first checks for staged changes, the second for unstaged ones.
        # We put them in this order because checking staged changes is *fast*.
        not command git diff-index --ignore-submodules --cached --quiet HEAD -- >/dev/null 2>&1
        or not command git diff --ignore-submodules --no-ext-diff --quiet --exit-code >/dev/null 2>&1
        and echo "true"
    )
    if test -n "$is_git_dirty"  # untracked or un-commited files
        set git_dirty_symbol "$pure_symbol_git_dirty"
        set git_dirty_color "$pure_color_git_dirty"
    end

    echo "$git_dirty_color$git_dirty_symbol"
end
