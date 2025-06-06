source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish

@echo (_print_filename (status filename))

function before_each
    _purge_configs
    source (status dirname)/../conf.d/pure.fish
    _clean_all_mocks
end

function screenshot \
    --description "Take screenshot" \
    --argument-names \
    name \
    action

    set --query action[1]; or set action fish_prompt


    $action \
        | terminal-screenshot \
        --output ./docs/assets/screenshots/$name.png \
        --margin 5 \
        --font-family "Noto Sans Mono, Noto Sans Symbols, Noto Sans Emoji"
    # --background-color white # some text are invisible with white background
end

if set --query CI
    before_each
    @test "screenshot: pure_check_for_new_release=true,with-update" (
        set --universal pure_check_for_new_release true
        set --global pure_version 0.0.1
        _mock_response curl '"tag_name": "v9.9.9",'

        screenshot "pure_check_for_new_release=true,with-update" _pure_check_for_new_release

    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_check_for_new_release=true,no-update" (
        set --universal pure_check_for_new_release true
        set --global pure_version 0.0.1
        _mock_response curl '"tag_name": "v0.0.1",'

        screenshot "pure_check_for_new_release=true,no-update" _pure_check_for_new_release
    ) $status -eq $SUCCESS


    before_each
    @test "screenshot: pure_enable_container_detection=true,inside" (
        set --universal pure_enable_container_detection true
        set --universal pure_symbol_container_prefix "🐋"

        screenshot "pure_enable_container_detection=true,inside"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_enable_container_detection=true,outside" (
        set --universal pure_enable_container_detection true
        _mock_exit_status _pure_is_inside_container $FAILURE

        screenshot "pure_enable_container_detection=true,outside"
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
