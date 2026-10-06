source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_git_truncate.fish
source (status dirname)/../functions/_pure_parse_directory.fish
@echo (_print_filename (status filename))


function before_each
    _purge_configs
    _disable_colors
    set --universal pure_shorten_prompt_current_directory_length 0
    set --universal pure_truncate_prompt_current_directory_keeps 0
    set --universal pure_truncate_prompt_current_directory_to_git_root false
end

function after_each
    set --erase pure_shorten_prompt_current_directory_length
end

before_each
@test "_pure_parse_directory: returns current directory" (
    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = $PWD

before_each
@test '_pure_parse_directory: replaces $HOME by ~' (
    pushd $HOME

    _pure_parse_directory
    popd
) = '~'

before_each
@test '_pure_parse_directory: shortens directory in prompt' (
    string length (_pure_parse_directory 1)
) -lt (string length $PWD)

before_each
@test '_pure_parse_directory: shorten current directory' (
    set --universal pure_shorten_prompt_current_directory_length 2

    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = /tm/cu/directory
after_each

before_each
@test '_pure_parse_directory: truncate 1, keeps only last directory name from current directory path' (
    set --universal pure_truncate_prompt_current_directory_keeps 1

    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = directory

before_each
@test '_pure_parse_directory: truncate n last component from current directory path' (
    set --universal pure_truncate_prompt_current_directory_keeps 2

    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = current/directory

before_each
@test '_pure_parse_directory: truncate 0, keeps full current directory path' (
    set --universal pure_truncate_prompt_current_directory_keeps 0

    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = /tmp/current/directory

before_each
@test '_pure_parse_directory: git root - returns repo folder name only when cwd is the repo root' (
    set --universal pure_truncate_prompt_current_directory_to_git_root true

    mkdir -p /tmp/test_pure_parse_directory_git_root/pure
    cd /tmp/test_pure_parse_directory_git_root/pure
    git init --quiet

    _pure_parse_directory
) = pure

before_each
@test '_pure_parse_directory: git root - returns repo folder name and subpath when in a subdirectory' (
    set --universal pure_truncate_prompt_current_directory_to_git_root true

    mkdir -p /tmp/test_pure_parse_directory_git_root/pure/functions
    cd /tmp/test_pure_parse_directory_git_root/pure
    git init --quiet
    cd functions

    _pure_parse_directory
) = pure/functions

before_each
@test '_pure_parse_directory: git root - leaves full path untouched when cwd is not a git repository' (
    set --universal pure_truncate_prompt_current_directory_to_git_root true

    mkdir -p /tmp/current/directory/
    cd /tmp/current/directory/

    _pure_parse_directory
) = $PWD

before_each
@test '_pure_parse_directory: git root - leaves full path untouched when disabled (default), even inside a git repository' (
    set --universal pure_truncate_prompt_current_directory_to_git_root false

    mkdir -p /tmp/test_pure_parse_directory_git_root/pure
    cd /tmp/test_pure_parse_directory_git_root/pure
    git init --quiet

    _pure_parse_directory
) = $PWD

before_each
@test '_pure_parse_directory: git root - applies pure_truncate_prompt_current_directory_keeps on top of git-root truncation' (
    set --universal pure_truncate_prompt_current_directory_to_git_root true
    set --universal pure_truncate_prompt_current_directory_keeps 1

    mkdir -p /tmp/test_pure_parse_directory_git_root/pure/functions
    cd /tmp/test_pure_parse_directory_git_root/pure
    git init --quiet
    cd functions

    _pure_parse_directory
) = functions


