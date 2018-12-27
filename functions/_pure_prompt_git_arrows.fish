function _pure_prompt_git_arrows
    set --local git_arrows
    set --local git_arrows_color

    set --local has_upstream (command git rev-parse --abbrev-ref '@{upstream}' 2>/dev/null)
    if test -n "$has_upstream"  # check there is an upstream repo configured
        command git rev-list --left-right --count 'HEAD...@{upstream}' \
        | read --local --array git_status
        set --local commit_to_push $git_status[1]
        set --local commit_to_pull $git_status[2]

        if test $commit_to_push -gt 0  # upstream is behind local repo
            set git_arrows "$pure_symbol_git_up_arrow"
        end

        if test $commit_to_pull -gt 0  # upstream is ahead of local repo
            set git_arrows "$git_arrows$pure_symbol_git_down_arrow"
        end

        set git_arrows_color "$pure_color_cyan"
    end

    echo "$git_arrows_color$git_arrows"
end
