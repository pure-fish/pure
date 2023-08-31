source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_prompt_git_branch.fish
source (status dirname)/../functions/_pure_parse_git_branch.fish
@echo (_print_filename (status filename))


function before_all
    mkdir -p /tmp/test_pure_prompt_git_branch # prevent conflict between parallel test files
    and cd /tmp/test_pure_prompt_git_branch

    git init --quiet
    git config --local user.email "you@example.com"
    git config --local user.name "Your Name"

    _purge_configs
    _disable_colors
end
before_all

function after_all
    rm -rf /tmp/test_pure_prompt_git_branch
end


@test "_pure_prompt_git_branch: show branch name" (
    _pure_prompt_git_branch
) = master

@test "_pure_prompt_git_branch: colorize branch name" (
    _pure_unmock _pure_set_color # enable colors
    set --universal pure_color_git_branch grey
    _pure_prompt_git_branch
) = (set_color grey)'master'


after_all
