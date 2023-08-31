source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_prompt_git_dirty.fish
@echo (_print_filename (status filename))


function before_each
    mkdir -p /tmp/pure_pure_prompt_git_dirty # prevent conflict between parallel test files
    and cd /tmp/pure_pure_prompt_git_dirty

    git init --quiet
    git config --local user.email "you@example.com"
    git config --local user.name "Your Name"

    _purge_configs
    _disable_colors
end

function after_each
    rm -rf /tmp/pure_pure_prompt_git_dirty
end


before_each
@test "_pure_prompt_git_dirty: empty repo is not marked as dirty" (
    set --universal pure_symbol_git_dirty '*'

    _pure_prompt_git_dirty
) = ''
after_each

before_each
@test "_pure_prompt_git_dirty: untracked files in empty repo marked as dirty" (
    touch file.txt

    set --universal pure_symbol_git_dirty '*'

    _pure_prompt_git_dirty
) = '*'
after_each

before_each
@test "_pure_prompt_git_dirty: staged files in empty repo marked as dirty" (
    echo "staged" >> file.txt
    git add file.txt

    set --universal pure_symbol_git_dirty '*'

    _pure_prompt_git_dirty
) = '*'
after_each

before_each
@test "_pure_prompt_git_dirty: clean is not marked as dirty" (
    echo "clean" >> file.txt
    git add file.txt
    git commit --quiet --message 'commit staged files'

    set --universal pure_symbol_git_dirty '*'

    _pure_prompt_git_dirty
) = ''
after_each

before_each
@test "_pure_prompt_git_dirty: untracked files mark git repo as dirty" (
    touch file_2.txt
    set --universal pure_symbol_git_dirty '*'

    _pure_prompt_git_dirty
) = '*'
after_each

before_each
@test "_pure_prompt_git_dirty: staged files mark git repo as dirty" (
    echo "staged" >> file_2.txt
    git add file_2.txt

    set --universal pure_symbol_git_dirty '*'

    _pure_prompt_git_dirty
) = '*'
after_each

before_each
@test "_pure_prompt_git_dirty: symbol is colorized" (
    echo "colorized" >> file.txt

    _pure_unmock _pure_set_color # enable colors
    set --universal pure_symbol_git_dirty '*'
    set --universal pure_color_git_dirty brblack

    _pure_prompt_git_dirty
) = (set_color brblack)'*'
after_each
