source $DIRNAME/../functions/_pure_prompt_git_branch.fish
source $DIRNAME/../functions/_pure_parse_git_branch.fish


function setup
    rm -r -f /tmp/pure

    mkdir -p /tmp/pure
    cd /tmp/pure

    git init --quiet
    git config --local user.email "you@example.com"
    git config --local user.name "Your Name"
end

test "_pure_prompt_git_branch: show branch name in gray"
    (
        set pure_color_git_branch (set_color brblack)

        _pure_prompt_git_branch
    ) = (set_color brblack)'master'
end

function teardown
    rm -r -f /tmp/pure
end
