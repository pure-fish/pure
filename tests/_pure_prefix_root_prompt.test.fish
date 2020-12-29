source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_set_color.fish
source $current_dirname/../functions/_pure_prefix_root_prompt.fish
@mesg (print_filename $current_filename)


function setup
    purge_configs
    disable_colors
    set --global pure_symbol_prefix_root_prompt '#'
end

@test "_pure_prefix_root_prompt: is empty for unprivileged user" (
    set --global pure_show_prefix_root_prompt true
    function id; echo 'nemo'; end # mock

    _pure_prefix_root_prompt
) = $EMPTY

@test "_pure_prefix_root_prompt: is shown for `root` user" (
    set --global pure_show_prefix_root_prompt true
    set --global pure_color_prefix_root_prompt red
    function id; echo 'root'; end # mock

    _pure_prefix_root_prompt
) = (set_color red)"#"

@test "_pure_prefix_root_prompt: require flag" (
    set --global pure_show_prefix_root_prompt false
    function id; echo 'root'; end # mock

    _pure_prefix_root_prompt
) = $EMPTY
