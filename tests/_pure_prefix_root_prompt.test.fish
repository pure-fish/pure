source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_set_color.fish
source $current_dirname/../functions/_pure_prefix_root_prompt.fish

set pure_symbol_prefix_root_prompt '#'

@test "_pure_prefix_root_prompt: is empty for unprivileged user" (
    set pure_show_prefix_root_prompt true
    function id; echo 'nemo'; end # mock

    _pure_prefix_root_prompt
) = $EMPTY

@test "_pure_prefix_root_prompt: is shown for `root` user" (
    set pure_show_prefix_root_prompt true
    set pure_color_prefix_root_prompt red
    function id; echo 'root'; end # mock

    _pure_prefix_root_prompt
) = (set_color red)"#$SPACE"

@test "_pure_prefix_root_prompt: require flag" (
    set pure_show_prefix_root_prompt false
    set pure_color_prefix_root_prompt red
    function id; echo 'root'; end # mock

    _pure_prefix_root_prompt
) = $EMPTY
