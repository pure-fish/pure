function _pure_prompt_git_dirty
    set --local git_dirty_symbol
    set --local git_dirty_color

    set --local is_git_dirty (
        # HEAD may not exist (e.g. immediately after git init); diff-index is
        # fast for staged checks but requires a ref.
        #
        # The diff-index (or diff --staged) checks for staged changes; the diff
        # checks for unstaged changes; the ls-files checks for untracked files.
        # We put them in this order because checking staged changes is *fast*.
        if command git rev-list --max-count=1 HEAD -- >/dev/null 2>&1;
            not command git diff-index --ignore-submodules --cached --quiet HEAD -- >/dev/null 2>&1;
        else;
            not command git diff --staged --ignore-submodules --no-ext-diff --quiet --exit-code >/dev/null 2>&1;
        end
        or not command git diff --ignore-submodules --no-ext-diff --quiet --exit-code >/dev/null 2>&1
        or command git ls-files --others --exclude-standard --directory --no-empty-directory --error-unmatch -- ':/*' >/dev/null 2>&1
        and echo "true"
    )
    if test -n "$is_git_dirty"  # untracked or un-commited files
        set git_dirty_symbol "$pure_symbol_git_dirty"
        set git_dirty_color (_pure_set_color $pure_color_git_dirty)
    end

    echo "$git_dirty_color$git_dirty_symbol"
end
