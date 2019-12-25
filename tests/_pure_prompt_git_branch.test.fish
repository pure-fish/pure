source $current_dirname/../functions/_pure_prompt_git_branch.fish
source $current_dirname/../functions/_pure_parse_git_branch.fish
source $current_dirname/../functions/_pure_set_color.fish

function setup
    mkdir -p /tmp/test_pure_prompt_git_branch  # prevent conflict between parallel test files
    cd /tmp/test_pure_prompt_git_branch

    git init --quiet
    git config --local user.email "you@example.com"
    git config --local user.name "Your Name"
end

function teardown
    rm --force --recursive /tmp/test_pure_prompt_git_branch
end

@test "_pure_prompt_git_branch: show branch name in gray" (
    set --global pure_color_git_branch brblack

    _pure_prompt_git_branch
) = (set_color brblack)'master'
