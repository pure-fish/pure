source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_git.fish
source $current_dirname/../functions/_pure_prompt_git_branch.fish
source $current_dirname/../functions/_pure_parse_git_branch.fish
source $current_dirname/../functions/_pure_set_color.fish
source $current_dirname/../functions/_pure_string_width.fish


function setup
    mkdir -p /tmp/test_pure_prompt_git  # prevent conflict between parallel test files
    cd /tmp/test_pure_prompt_git
end

function teardown
    rm --force --recursive /tmp/test_pure_prompt_git
end

@test "_pure_prompt_git: ignores directory that are not git repository" (
    function _pure_prompt_git_dirty; echo $EMPTY; end
    function _pure_prompt_git_pending_commits; echo $EMPTY; end

    _pure_prompt_git
) $status -eq $SUCCESS

@test "_pure_prompt_git: activates on git repository" (
    git init --quiet
    function _pure_prompt_git_dirty; echo $EMPTY; end
    function _pure_prompt_git_pending_commits; echo $EMPTY; end

    set --global pure_enable_git true
    set --global pure_color_git_branch $EMPTY
    set --global pure_color_git_dirty $EMPTY
    set --global pure_color_git_unpulled_commits $EMPTY
    set --global pure_color_git_unpushed_commits $EMPTY

    _pure_prompt_git
) = 'master'

@test "_pure_prompt_git: activates on dirty repository" (
    git init --quiet
    function _pure_prompt_git_dirty; echo '*'; end
    function _pure_prompt_git_pending_commits; echo $EMPTY; end

    set --global pure_enable_git true
    set --global pure_color_git_branch $EMPTY
    set --global pure_color_git_dirty $EMPTY
    set --global pure_color_git_unpulled_commits $EMPTY
    set --global pure_color_git_unpushed_commits $EMPTY

    _pure_prompt_git
) = 'master*'

@test "_pure_prompt_git: activates on repository with upstream changes" (
    git init --quiet
    function _pure_prompt_git_dirty; echo $EMPTY; end
    function _pure_prompt_git_pending_commits; echo 'v'; end

    set --global pure_enable_git true
    set --global pure_color_git_branch $EMPTY
    set --global pure_color_git_dirty $EMPTY
    set --global pure_color_git_unpulled_commits $EMPTY
    set --global pure_color_git_unpushed_commits $EMPTY

    _pure_prompt_git
) = 'master v'

@test "_pure_prompt_git: returns an $EMPTY string when pure_enable_git is false" (
    git init --quiet
    function _pure_prompt_git_dirty; echo $EMPTY; end
    function _pure_prompt_git_pending_commits; echo $EMPTY; end

    set --global pure_enable_git false
    set --global pure_color_git_branch $EMPTY
    set --global pure_color_git_dirty $EMPTY
    set --global pure_color_git_unpulled_commits $EMPTY
    set --global pure_color_git_unpushed_commits $EMPTY

    _pure_prompt_git
) $status -eq $SUCCESS
