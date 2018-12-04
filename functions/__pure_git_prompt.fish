function parse_git_branch -d "Parse current Git branch name"
    command git symbolic-ref --short HEAD 2>/dev/null;
        or echo (command git show-ref --head -s --abbrev HEAD)[1]
end


function git_branch_prompt
    set --local git_branch (parse_git_branch) # current git branch
    set --local git_branch_color "$pure_color_gray"

    echo "$git_branch_color$git_branch"
end

function git_dirty_prompt
    set --local git_dirty_symbol

    # Check if there are files to commit
    set --local is_git_dirty (command git status --porcelain --ignore-submodules ^/dev/null)
    if test -n "$is_git_dirty"
        set git_dirty_symbol "$pure_symbol_git_dirty"
    end

    echo "$git_dirty_symbol"
end

function git_arrows_prompt
    set --local git_arrows
    set --local git_arrows_color

    # Check if there is an upstream configured
    command git rev-parse --abbrev-ref '@{upstream}' >/dev/null ^&1; and set -l has_upstream
    if set -q has_upstream
        command git rev-list --left-right --count 'HEAD...@{upstream}' | read -la git_status

        set --local git_arrow_left $git_status[1]
        set --local git_arrow_right $git_status[2] 

        # If arrow is not "0", it means it's dirty
        if test $git_arrow_left != 0
            set git_arrows "$pure_symbol_git_up_arrow"
        end

        if test $git_arrow_right != 0
            set git_arrows "$git_arrows$pure_symbol_git_down_arrow"
        end

        # Format Git arrows
        set git_arrows_color "$pure_color_cyan"
    end
 
    echo "$git_arrows_color$git_arrows"
end

function __pure_git_prompt
    # Check if is on a Git repository
    set --local is_git_repository (command git rev-parse --is-inside-work-tree ^/dev/null)
    if test -n "$is_git_repository"
        set --local git_prompt (git_branch_prompt)(git_dirty_prompt)
        set --local git_arrows (git_arrows_prompt)
        if test (__pure_string_width $git_arrows) -ne 0
            set git_prompt $git_prompt $git_arrows
        end
        echo $git_prompt
    end
end
