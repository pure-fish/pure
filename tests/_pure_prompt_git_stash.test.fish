source $current_dirname/../functions/_pure_prompt_git_stash.fish
source $current_dirname/../functions/_pure_set_color.fish

function setup
    rm -r -f /tmp/pure_pure_prompt_git_stash

    mkdir -p /tmp/pure_pure_prompt_git_stash
    cd /tmp/pure_pure_prompt_git_stash

    git init --quiet
    git config --local user.email "you@example.com"
    git config --local user.name "Your Name"
end

function teardown
    rm -r -f /tmp/pure_pure_prompt_git_stash
end

@test "_pure_prompt_git_stash: check git stash indicator" (
    touch file.txt
    git add .
    git stash
    set --global pure_symbol_git_stash '≡'
    set --global pure_color_git_stash brblack

    _pure_prompt_git_stash
) = (set_color brblack)'≡'

