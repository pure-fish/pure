source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_git_branch.fish
source $current_dirname/../functions/_pure_parse_git_branch.fish
source $current_dirname/../functions/_pure_set_color.fish
@mesg (_print_filename $current_filename)


function setup
    _purge_configs
    _disable_colors
    mkdir -p /tmp/test_pure_prompt_git_branch  # prevent conflict between parallel test files
    cd /tmp/test_pure_prompt_git_branch

    git init --quiet
    git config --local user.email "you@example.com"
    git config --local user.name "Your Name"
end

function teardown
    rm -rf /tmp/test_pure_prompt_git_branch
end

@test "_pure_prompt_git_branch: show branch name in gray" (
    _pure_prompt_git_branch
) = 'master'
