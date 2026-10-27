source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_git_truncate.fish
@echo (_print_filename (status filename))


function before_each
    _purge_configs
    _disable_colors
    set --universal pure_truncate_prompt_current_directory_to_git_root false
end

function after_each
    rm -rf /tmp/test_pure_prompt_git_truncate
end

before_each
@test '_pure_prompt_git_truncate: disabled (default) - outputs nothing even inside a git repository' (
    mkdir -p /tmp/test_pure_prompt_git_truncate/pure
    cd /tmp/test_pure_prompt_git_truncate/pure
    git init --quiet

    count (_pure_prompt_git_truncate)
) -eq 0

before_each
@test '_pure_prompt_git_truncate: disabled (default) - returns failure status' (
    mkdir -p /tmp/test_pure_prompt_git_truncate/pure
    cd /tmp/test_pure_prompt_git_truncate/pure
    git init --quiet

    _pure_prompt_git_truncate
    echo $status
) -eq $FAILURE

before_each
@test '_pure_prompt_git_truncate: enabled - returns repo folder name when cwd is the repo root' (
    set --universal pure_truncate_prompt_current_directory_to_git_root true

    mkdir -p /tmp/test_pure_prompt_git_truncate/pure
    cd /tmp/test_pure_prompt_git_truncate/pure
    git init --quiet

    _pure_prompt_git_truncate
) = pure

before_each
@test '_pure_prompt_git_truncate: enabled - returns repo folder name and subpath when in a subdirectory' (
    set --universal pure_truncate_prompt_current_directory_to_git_root true

    mkdir -p /tmp/test_pure_prompt_git_truncate/pure/functions
    cd /tmp/test_pure_prompt_git_truncate/pure
    git init --quiet
    cd functions

    _pure_prompt_git_truncate
) = pure/functions

before_each
@test '_pure_prompt_git_truncate: enabled - returns success status inside a git repository' (
    set --universal pure_truncate_prompt_current_directory_to_git_root true

    mkdir -p /tmp/test_pure_prompt_git_truncate/pure
    cd /tmp/test_pure_prompt_git_truncate/pure
    git init --quiet

    _pure_prompt_git_truncate >/dev/null
    echo $status
) -eq $SUCCESS

before_each
@test '_pure_prompt_git_truncate: enabled - outputs nothing when cwd is not a git repository' (
    set --universal pure_truncate_prompt_current_directory_to_git_root true

    mkdir -p /tmp/test_pure_prompt_git_truncate/plain
    cd /tmp/test_pure_prompt_git_truncate/plain

    count (_pure_prompt_git_truncate)
) -eq 0

before_each
@test '_pure_prompt_git_truncate: enabled - returns failure status when cwd is not a git repository' (
    set --universal pure_truncate_prompt_current_directory_to_git_root true

    mkdir -p /tmp/test_pure_prompt_git_truncate/plain
    cd /tmp/test_pure_prompt_git_truncate/plain

    _pure_prompt_git_truncate
    echo $status
) -eq $FAILURE

after_each
