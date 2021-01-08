# Script to create screenshot context

set coming_from (pwd)
function install_theme
    fisher list | grep --quiet edouard-lopez/ayu-theme.fish
    or fisher install edouard-lopez/ayu-theme.fish
    and set --universal ayu_variant light && ayu_load_theme
end

set --global mock_directory $HOME/dev/
function setup_mock_environment
    git init --bare --quiet /tmp/fake.git
    mkdir -p $mock_directory/pure/
    cd $mock_directory/pure/
    git init --quiet
    git remote add origin /tmp/fake.git/
    touch mock.file-1; git add mock.file-1; git commit --message='mock.file-1' --quiet
    touch mock.file-2; git add mock.file-2; git commit --message='mock.file-2' --quiet
    git push --set-upstream origin master
end

function revert
    git reset master -q
    cd $HOME
end

function teardown_mock_environment
echo "teardown_mock_environment"
    cd $coming_from
    rm --recursive --force $mock_directory /tmp/fake.git/

    set --erase colorscheme
    functions --erase install_theme
    functions --erase pure
    functions --erase revert
    functions --erase setup_mock_environment
    functions --erase teardown_mock_environment
    echo 'cleaned'
end


install_theme
setup_mock_environment
clear
# PLAY ACTION HERE
sleep 6s; false
cd $HOME/dev/pure
git reset HEAD~1
fish --interactive --init-command="cd $HOME; ; clear"
and teardown_mock_environment
