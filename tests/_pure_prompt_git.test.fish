source $current_dirname/../functions/_pure_prompt_git.fish
source $current_dirname/../functions/_pure_prompt_git_branch.fish
source $current_dirname/../functions/_pure_string_width.fish

set --local succeed 0
set --local empty ''

function teardown
    rm -r -f /tmp/test
end

@test "_pure_prompt_git: ignores directory that are not git repository" (
        mkdir --parents /tmp/test
        cd /tmp/test

        _pure_prompt_git
    ) $status -eq $succeed
end

@test "_pure_prompt_git: activates on git repository" (
        mkdir --parents /tmp/test
        cd /tmp/test
        git init --quiet
        function _pure_prompt_git_dirty; echo $empty; end
        function git_pending_commits; echo $empty; end

        set pure_color_git_branch $empty
        set pure_color_git_dirty $empty
        set pure_color_git_pending_commits $empty

        _pure_prompt_git
    ) = 'master'
end

@test "_pure_prompt_git: activates on dirty repository" (
        mkdir --parents /tmp/test
        cd /tmp/test
        git init --quiet
        function _pure_prompt_git_dirty; echo '*'; end
        function git_pending_commits; echo $empty; end

        set pure_color_git_branch $empty
        set pure_color_git_dirty $empty
        set pure_color_git_pending_commits $empty

        _pure_prompt_git
    ) = 'master*'
end

@test "_pure_prompt_git: activates on repository with upstream changes" (
        mkdir --parents /tmp/test
        cd /tmp/test
        git init --quiet
        function _pure_prompt_git_dirty; echo $empty; end
        function git_pending_commits; echo 'v'; end

        set pure_color_git_branch $empty
        set pure_color_git_dirty $empty
        set pure_color_git_pending_commits $empty

        _pure_prompt_git
    ) = 'master v'
end

