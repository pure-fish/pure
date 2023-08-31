source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_prompt_git_pending_commits.fish
@echo (_print_filename (status filename))

function before_each
    after_each
    set --global fake_repo /tmp/pure
    set --global fake_remote /tmp/remote.git

    git init --bare --quiet $fake_remote
    mkdir -p $fake_repo
    and cd $fake_repo
    git init --quiet
    git config --local user.email "you@example.com"
    git config --local user.name "Your Name"
    git remote add origin ../remote.git/
    touch file.txt
    git add file.txt
    git commit --quiet --message='init'

    _purge_configs
    _disable_colors
end

function after_each
    rm -rf \
        $fake_repo \
        $fake_remote
    set --erase --global fake_repo
    set --erase --global fake_remote
end


@test "_pure_prompt_git_pending_commits: print nothing when no upstream repo" (
    before_each

    cd $fake_repo

    _pure_prompt_git_pending_commits
) = $EMPTY

@test "_pure_prompt_git_pending_commits: show arrow UP when branch is AHEAD of upstream (need git push)" (
    before_each

    git push --set-upstream --quiet origin master > /dev/null
    touch missing-on-upstream.txt
    git add missing-on-upstream.txt
    git commit --quiet --message='missing on upstream'

    set --universal pure_symbol_git_unpushed_commits '^'

    _pure_prompt_git_pending_commits
) = '^'

@test "_pure_prompt_git_pending_commits: show arrow DOWN when branch is BEHIND upstream (need git pull)" (
    before_each

    touch another-file.txt
    git add another-file.txt
    git commit --quiet --message='another'
    git push --set-upstream --quiet origin master > /dev/null

    git reset --hard --quiet HEAD~1

    set --universal pure_symbol_git_unpulled_commits 'v'

    _pure_prompt_git_pending_commits
) = v

@test "_pure_prompt_git_pending_commits: empty repo don't throw error" (
    before_each

    set fake_empty_repo /tmp/empty-remote
    set fake_empty_remote /tmp/empty-remote.git
    rm -rf \
        $fake_empty_repo \
        $fake_empty_remote
    git init --bare --quiet $fake_empty_remote
    git clone --quiet $fake_empty_remote $fake_empty_repo
    cd $fake_empty_repo

    _pure_prompt_git_pending_commits
) = $EMPTY

@test "_pure_prompt_git_pending_commits: symbol is colorized" (
    before_each

    git push --set-upstream --quiet origin master > /dev/null
    touch missing-on-upstream.txt
    git add missing-on-upstream.txt
    git commit --quiet --message='missing on upstream'

    _pure_unmock _pure_set_color # enable colors
    set --universal pure_symbol_git_unpushed_commits '^'
    set --universal pure_color_git_unpushed_commits cyan

    _pure_prompt_git_pending_commits
) = (set_color cyan)'^'

after_each
