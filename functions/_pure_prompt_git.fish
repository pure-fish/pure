function _pure_prompt_git
    # Check if is on a Git repository
    set --local is_git_repository (command git rev-parse --is-inside-work-tree ^/dev/null)
    if test -n "$is_git_repository"
        set --local git_prompt (_pure_prompt_git_branch)(_pure_prompt_git_dirty)
        set --local git_arrows (_pure_prompt_git_arrows)
        if test (_pure_string_width $git_arrows) -ne 0
            set git_prompt $git_prompt $git_arrows
        end
        echo $git_prompt
    end
end
