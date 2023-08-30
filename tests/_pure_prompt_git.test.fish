source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_git.fish
source (status dirname)/../functions/_pure_prompt_git_branch.fish
source (status dirname)/../functions/_pure_parse_git_branch.fish
source (status dirname)/../functions/_pure_string_width.fish
source (status dirname)/../functions/_pure_prompt_git_stash.fish
@echo (_print_filename (status filename))


function before_all
    mkdir -p /tmp/test_pure_prompt_git # prevent conflict between parallel test files
    and cd /tmp/test_pure_prompt_git

    _purge_configs
    _disable_colors
end
before_all

function after_all
    rm -rf /tmp/test_pure_prompt_git
end


@test "_pure_prompt_git: fails when git is missing" (
    set --universal pure_enable_git true
    function type  # mock git absence, see https://github.com/fish-shell/fish-shell/issues/5444
        if test "x$argv" = "x-q --no-functions git"
            return $FAILURE
        end
    end

    _pure_prompt_git
    set exit_status $status

    functions --erase type  # remove mock
    echo $exit_status
) -eq $ABORT_FEATURE

@test "_pure_prompt_git: ignores directory that are not git repository" (
    function _pure_prompt_git_dirty; echo $EMPTY; end
    function _pure_prompt_git_pending_commits; echo $EMPTY; end

    _pure_prompt_git
) $status -eq $SUCCESS

@test "_pure_prompt_git: activates on git repository" (
    git init --quiet
    function _pure_prompt_git_dirty; echo $EMPTY; end
    function _pure_prompt_git_pending_commits; echo $EMPTY; end

    set --universal pure_enable_git true

    _pure_prompt_git
) = master

@test "_pure_prompt_git: activates on dirty repository" (
    git init --quiet
    function _pure_prompt_git_dirty; echo '*'; end
    function _pure_prompt_git_pending_commits; echo $EMPTY; end

    set --universal pure_enable_git true

    _pure_prompt_git
) = 'master*'

@test "_pure_prompt_git: activates on repository with upstream changes" (
    git init --quiet
    function _pure_prompt_git_dirty; echo $EMPTY; end
    function _pure_prompt_git_pending_commits; echo 'v'; end

    set --universal pure_enable_git true

    _pure_prompt_git
) = 'master v'

@test "_pure_prompt_git: returns an $EMPTY string when pure_enable_git is false" (
    git init --quiet
    function _pure_prompt_git_dirty; echo $EMPTY; end
    function _pure_prompt_git_pending_commits; echo $EMPTY; end

    set --universal pure_enable_git false

    _pure_prompt_git
) $status -eq $SUCCESS


after_all
