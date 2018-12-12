function _pure_prompt_git_dirty
    set --local git_dirty_symbol

    # Check if there are files to commit
    set --local is_git_dirty (command git status --porcelain --ignore-submodules ^/dev/null)
    if test -n "$is_git_dirty"
        set git_dirty_symbol "$pure_symbol_git_dirty"
    end

    echo "$git_dirty_symbol"
end
