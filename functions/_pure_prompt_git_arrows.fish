function _pure_prompt_git_arrows
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
