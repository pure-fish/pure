source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_parse_git_branch.fish
@echo (_print_filename (status filename))


function before_all
    _purge_configs
    _disable_colors
    mkdir -p /tmp/test_pure_parse_git_branch # prevent conflict between parallel test files
    cd /tmp/test_pure_parse_git_branch

    git init --quiet
    git config --global user.email "you@example.com"
    git config --global user.name "Your Name"
end
before_all

function after_all
    rm -rf /tmp/test_pure_parse_git_branch
end


@test "_pure_parse_git_branch: returns current branch" (
    cd /tmp/test_pure_parse_git_branch

    _pure_parse_git_branch
) = master


@test "_pure_parse_git_branch: returns number of commits behind current branch" (
    touch file.txt
    git add file.txt
    git commit --quiet --message="init"

    touch another.txt
    git add another.txt
    git commit --quiet --message="another"

    git checkout --quiet "HEAD~1"

    _pure_parse_git_branch
) = 'master~1'


after_all
