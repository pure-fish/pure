source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/../tools/releaser.fish
@echo (_print_filename (status filename))

set new_version 9.9.9
set --global PURE_CONFIG_VERSION_REGEX '(?<=pure_version )(?<value>[^\s#]+)'

function setup
    git init --quiet
    git config --local user.email "you@example.com"
    git config --local user.name "Your Name"
end; setup

function teardown
    git tag --delete $new_version
end

@test "releaser: given version argument is then throw an error and a message" (
    releaser
) = "missing argument: \$new_version"

# releaser is used by maintainers of the project,
# it doesn't really matter it's not tested for old versions
# https://github.com/fish-shell/fish-shell/releases/tag/3.2.0
if fish_version_at_least 3.2.0
    @test "releaser: bump version in ./conf.d/pure.fish" (
    releaser $new_version

    head -n 1 (dirname (status filename))/../conf.d/pure.fish \
    | string match --regex --quiet $PURE_CONFIG_VERSION_REGEX;

    echo $value
) = "$new_version"
end

@test "releaser: commit bump version" (
    function git; echo (status function) "$argv" > /tmp/called; end # spy

    commit $new_version
    _has_called 'git commit'
) $status -eq $SUCCESS

@test "releaser: last commit is version bump" (
    functions --erase git

    releaser $new_version

    git log -1 --pretty=%s | string match --regex --quiet 'chore: bump version '$PURE_VERSION_NUMBER_REGEX
) $status -eq $SUCCESS
