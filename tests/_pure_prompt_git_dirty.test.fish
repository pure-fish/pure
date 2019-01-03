source $DIRNAME/../functions/_pure_prompt_git_dirty.fish
source $DIRNAME/../functions/_pure_parse_git_branch.fish


function setup
    rm --recursive --force /tmp/pure

    mkdir -p /tmp/pure
    cd /tmp/pure

    git init --quiet
    git config --local user.email "you@example.com"
    git config --local user.name "Your Name"
end

test "untracked files make git repo as dirty"
    (
        touch file.txt
        set pure_symbol_git_dirty '*'
        set pure_color_git_dirty (set_color brblack)

        _pure_prompt_git_dirty
    ) = (set_color brblack)'*'
end

test "staged files mark git repo as dirty"
    (
        touch file.txt
        git add file.txt
        set pure_symbol_git_dirty '*'
        set pure_color_git_dirty (set_color brblack)

        _pure_prompt_git_dirty
    ) = (set_color brblack)'*'
end
function teardown
    rm --recursive --force /tmp/pure
end
