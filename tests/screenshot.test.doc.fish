source (status dirname)/fixtures/constants.fish
@echo (_print_filename (status filename))

function before_each
    _purge_configs
    source ../conf.d/pure.fish
end

function screenshot \
    --description "Take screenshot" \
    --argument-names \
    name \
    action

    set --query action; or set action fish_prompt


    $action \
        | terminal-screenshot \
        --output ./docs/assets/screenshots/$name.png \
        --margin 5 \
        --font-family "Noto Sans Mono, Noto Sans Symbols, Noto Sans Emoji"
    # --background-color white # some text are invisible with white background
end

function boolean_test \
    --description "Take screenshot" \
    --argument-names \
    name \
    setup_context \
    value \
    action

    echo $value
    echo $action
    echo $setup_context
    before_each
    @test "screenshot `$name $value`" (
        $setup_context
        set --universal $name $value
        screenshot "$name=$value" $action
    ) $status -eq $SUCCESS
end


if set --query CI
    function setup
        set --universal pure_check_for_new_release true
        set --universal pure_version 0.0.1
        function curl
            echo '"tag_name": "v0.0.1",'
        end # mock
    end
    # boolean_test pure_check_for_new_release setup false _pure_check_for_new_release
    before_each
    @test "screenshot `pure_check_for_new_release true`" (
        set --universal pure_check_for_new_release true
        set --universal pure_version 0.0.1
        function curl
            echo '"tag_name": "v0.0.1",'
        end # mock

        screenshot "pure_check_for_new_release=true" _pure_check_for_new_release

    ) $status -eq $SUCCESS



    # boolean_features pure_enable_container_detection # true
    # boolean_features pure_begin_prompt_with_current_directory # true
    # boolean_features pure_enable_git # true
    # boolean_features pure_show_jobs # false
    # boolean_features pure_enable_k8s # false
    # boolean_features pure_enable_nixdevshell # false
    # boolean_features pure_enable_virtualenv # true
    # boolean_features pure_separate_prompt_on_error # false
    # boolean_features pure_enable_single_line_prompt # false
    # boolean_features pure_show_system_time # false
    # boolean_features pure_show_subsecond_command_duration # false
    # boolean_features pure_reverse_prompt_symbol_in_vimode # true
    # boolean_features pure_show_prefix_root_prompt # false

    # pure_threshold_command_duration 5
    # pure_shorten_prompt_current_directory_length 0
    # pure_truncate_prompt_current_directory_keeps 0
    # pure_shorten_window_title_current_directory_length 0
    # pure_truncate_window_title_current_directory_keeps 0



    # before_each
    # @test "screenshot `pure_enable_git false`" (
    #     set --universal pure_enable_git false
    #     screenshot "pure_enable_git=false"
    # ) $status -eq $SUCCESS

    # before_each
    # @test "screenshot `pure_enable_git true `" (
    #     set --universal pure_enable_git true
    #     screenshot "pure_enable_git=true"
    # ) $status -eq $SUCCESS

    # before_each
    # @test "screenshot `pure_enable_k8s false`" (
    #     set --universal pure_enable_k8s false
    #     screenshot "pure_enable_k8s=false"
    # ) $status -eq $SUCCESS

    # before_each
    # @test "screenshot `pure_enable_k8s true `" (
    #     set --universal pure_enable_k8s true
    #     screenshot "pure_enable_k8s=true"
    # ) $status -eq $SUCCESS

    # before_each
    # @test "screenshot `pure_enable_container_detection false`" (
    #     set --universal pure_enable_container_detection false
    #     screenshot "pure_enable_container_detection=false"
    # ) $status -eq $SUCCESS

    # before_each
    # @test "screenshot `pure_enable_container_detection true `" (
    #     set --universal pure_enable_container_detection true
    #     screenshot "pure_enable_container_detection=true"
    # ) $status -eq $SUCCESS

    # before_each
    # @test "screenshot `pure_enable_virtualenv false`" (
    #     set --universal pure_enable_virtualenv false
    #     screenshot "pure_enable_virtualenv=false"
    # ) $status -eq $SUCCESS

    # before_each
    # @test "screenshot `pure_enable_virtualenv true `" (
    #     set --universal pure_enable_virtualenv true
    #     screenshot "pure_enable_virtualenv=true"
    # ) $status -eq $SUCCESS

    # before_each
    # @test "screenshot `pure_enable_single_line_prompt false`" (
    #     set --universal pure_enable_single_line_prompt false
    #     screenshot "pure_enable_single_line_prompt=false"
    # ) $status -eq $SUCCESS

    # before_each
    # @test "screenshot `pure_enable_single_line_prompt true `" (
    #     set --universal pure_enable_single_line_prompt true
    #     screenshot "pure_enable_single_line_prompt=true"
    # ) $status -eq $SUCCESS
end
