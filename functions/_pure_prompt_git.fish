function _pure_prompt_git \
    --description 'Print git repository informations: branch name, dirty, upstream ahead/behind'

    set --local is_git_repository (command git rev-parse --is-inside-work-tree 2>/dev/null)

    if test -n "$is_git_repository"
        set --local git_prompt (_pure_prompt_git_branch)(_pure_prompt_git_dirty)
        set --local git_pending_commits (_pure_prompt_git_pending_commits)

        if test (_pure_string_width $git_pending_commits) -ne 0
            set git_prompt $git_prompt $git_pending_commits
        end

        echo $git_prompt
    end
end
