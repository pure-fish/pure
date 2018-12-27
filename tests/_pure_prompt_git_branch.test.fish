source $DIRNAME/../functions/_pure_prompt_git_branch.fish
source $DIRNAME/../functions/_pure_parse_git_branch.fish


function setup
    rm --recursive --force /tmp/pure

    mkdir -p /tmp/pure
    cd /tmp/pure

    git init --quiet
    git config --local user.email "you@example.com"
    git config --local user.name "Your Name"
end

test "show branch name in gray"
    (
        set pure_color_gray (set_color 93A1A1)
        
        _pure_prompt_git_branch
    ) = (set_color 93A1A1)'master'
end

function teardown
    rm --recursive --force /tmp/pure
end