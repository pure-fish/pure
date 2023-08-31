source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_prompt_git_stash.fish
@echo (_print_filename (status filename))


function before_each
    after_each
    set --global fake_repo /tmp/pure

    mkdir -p $fake_repo
    and cd $fake_repo

    git init --quiet
    git config --local user.email "you@example.com"
    git config --local user.name "Your Name"

    _purge_configs
    _disable_colors
end

function after_each
    rm -rf \
        $fake_repo
    set --erase --global fake_repo
end


@test "_pure_prompt_git_stash: no indicator when no stash" (
    before_each
    set --universal pure_symbol_git_stash '≡'
    touch init.file
    git add init.file
    git commit --quiet --message 'mandatory initial commit'

    _pure_prompt_git_stash
) = $EMPTY

@test "_pure_prompt_git_stash: stashing file shows indicator" (
    before_each
    set --universal pure_symbol_git_stash '≡'
    touch init.file stash.file
    git add init.file
    git commit --quiet --message 'mandatory initial commit'
    git add stash.file
    git stash --quiet

    _pure_prompt_git_stash
) = ' ≡'

@test "_pure_prompt_git_stash: symbol is colorized" (
    before_each
    touch init.file stash.file
    git add init.file
    git commit --quiet --message 'mandatory initial commit'
    git add stash.file
    git stash --quiet

    _pure_unmock _pure_set_color # enable colors
    set --universal pure_symbol_git_stash '≡'
    set --universal pure_color_git_stash cyan

    _pure_prompt_git_stash
) = (set_color cyan)' ≡'


after_each
