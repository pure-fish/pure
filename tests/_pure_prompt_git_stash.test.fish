source $current_dirname/../functions/_pure_prompt_git_stash.fish
source $current_dirname/../functions/_pure_set_color.fish
source $current_dirname/fixtures/constants.fish

function setup
    rm -rf /tmp/pure_pure_prompt_git_stash

    mkdir -p /tmp/pure_pure_prompt_git_stash
    cd /tmp/pure_pure_prompt_git_stash

    git init --quiet
    git config --local user.email "you@example.com"
    git config --local user.name "Your Name"
end

function teardown
    rm -rf /tmp/pure_pure_prompt_git_stash
end

@test "_pure_prompt_git_stash: no indicator when no stash" (
    set --global pure_symbol_git_stash '≡'
    set --global pure_color_git_stash $EMPTY
    touch init.file
    git add init.file
    git commit --quiet --message 'mandatory initial commit'

    _pure_prompt_git_stash
) = $EMPTY

@test "_pure_prompt_git_stash: stashing file shows indicator" (
    set --global pure_symbol_git_stash '≡'
    set --global pure_color_git_stash $EMPTY
    touch init.file stash.file
    git add init.file
    git commit --quiet --message 'mandatory initial commit'
    git add stash.file
    git stash --quiet

    _pure_prompt_git_stash
) = ' ≡'

