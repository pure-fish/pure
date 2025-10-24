source (status dirname)/../tests/fixtures/constants.fish
source (status dirname)/../tests/mocks/spectra.fish

@echo (_print_filename (status filename))

# Ensure the output directory exists with proper permissions
set output_dir (status dirname)/../docs/assets/screenshots

function before_each
    _purge_configs
    source (status dirname)/../conf.d/pure.fish
    _disable_all_configs
    _clean_all_mocks
end

function screenshot \
    --description "Take screenshot" \
    --argument-names \
    name \
    action

    set --query action[1]; or set action fish_prompt

    set light_colorscheme_options --color-scheme (status dirname)/colorscheme/ayu-light.json --background-color '#fafafa'
    set dark_colorscheme_options --color-scheme (status dirname)/colorscheme/ayu-dark.json --background-color '#0f111a'
    set mirage_colorscheme_options --color-scheme (status dirname)/colorscheme/ayu-mirage.json --background-color '#1f2430'

    for theme in light mirage
        printf "$theme" >&2
        set colorscheme {$theme}_colorscheme_options
        eval $action \
            | terminal-screenshot \
            --margin 5px \
            --output (status dirname)/../docs/assets/screenshots/$theme-$name.png \
            --font-family "Noto Sans Mono, Noto Sans Symbols, Noto Sans Emoji" \
            $$colorscheme && printf "📸 " >&2 || printf "❌ " >&2
    end

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
        set --universal pure_symbol_container_prefix "🐋$SPACE"

        screenshot "pure_enable_container_detection=true,inside"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_enable_container_detection=true,outside" (
        set --universal pure_enable_container_detection true
        _mock_exit_status _pure_is_inside_container $FAILURE

        screenshot "pure_enable_container_detection=true,outside"
    ) $status -eq $SUCCESS

    # Git enable/disable
    before_each
    @test "screenshot: pure_enable_git=false" (
        set --universal pure_enable_git false

        screenshot "pure_enable_git=false"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_enable_git=true" (
        set --universal pure_enable_git true
        # Mock git functions to show git info
        function _pure_prompt_git_dirty; echo '*'; end
        function _pure_prompt_git_pending_commits; echo '⇡'; end

        screenshot "pure_enable_git=true"
    ) $status -eq $SUCCESS

    # Jobs indicator
    before_each
    @test "screenshot: pure_show_jobs=false" (
        set --universal pure_show_jobs false
        sleep 0.5s &  # Create background job

        screenshot "pure_show_jobs=false"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_show_jobs=true" (
        set --universal pure_show_jobs true
        sleep 0.5s &  # Create background job

        screenshot "pure_show_jobs=true"
    ) $status -eq $SUCCESS

    # Kubernetes context
    before_each
    @test "screenshot: pure_enable_k8s=false" (
        set --universal pure_enable_k8s false
        _mock kubectl
        _mock_response _pure_k8s_context "my-context"
        _mock_response _pure_k8s_namespace "default"

        screenshot "pure_enable_k8s=false"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_enable_k8s=true" (
        set --universal pure_enable_k8s true
        set --universal pure_symbol_k8s_prefix "☸$SPACE"
        _mock kubectl
        _mock_response _pure_k8s_context "my-context"
        _mock_response _pure_k8s_namespace "my-namespace"

        screenshot "pure_enable_k8s=true"
    ) $status -eq $SUCCESS

    # Nix dev shell
    before_each
    @test "screenshot: pure_enable_nixdevshell=false" (
        set --universal pure_enable_nixdevshell false
        set --global IN_NIX_SHELL pure

        screenshot "pure_enable_nixdevshell=false"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_enable_nixdevshell=true" (
        set --universal pure_enable_nixdevshell true
        set --universal pure_symbol_nixdevshell_prefix "❄️$SPACE"
        set --global IN_NIX_SHELL pure

        screenshot "pure_enable_nixdevshell=true"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_symbol_prompt=success" (
        set --local action 'true; fish_prompt'

        screenshot "pure_symbol_prompt=success" $action
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_symbol_prompt=error" (
        set --local action 'false; fish_prompt'

        screenshot "pure_symbol_prompt=error" $action
    ) $status -eq $SUCCESS

    # Python virtualenv
    before_each
    @test "screenshot: pure_enable_virtualenv=false" (
        set --universal pure_enable_virtualenv false
        set --global VIRTUAL_ENV /home/user/projects/my-project/venv

        screenshot "pure_enable_virtualenv=false"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_enable_virtualenv=true" (
        set --universal pure_enable_virtualenv true
        set --universal pure_symbol_virtualenv_prefix "🐍$SPACE"
        set --global VIRTUAL_ENV /home/user/projects/my-project/venv

        screenshot "pure_enable_virtualenv=true"
    ) $status -eq $SUCCESS

    # AWS profile
    before_each
    @test "screenshot: pure_enable_aws_profile=false" (
        set --universal pure_enable_aws_profile false
        set --global AWS_PROFILE production

        screenshot "pure_enable_aws_profile=false"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_enable_aws_profile=true" (
        set --universal pure_enable_aws_profile true
        set --universal pure_symbol_aws_profile_prefix "☁️$SPACE"
        set --global AWS_PROFILE production

        screenshot "pure_enable_aws_profile=true"
    ) $status -eq $SUCCESS

    # Separate prompt on error
    before_each
    @test "screenshot: pure_separate_prompt_on_error=false" (
        set --universal pure_separate_prompt_on_error false
        set --global _pure_fresh_session false

        set --local action 'false; fish_prompt' # Simulate last command failure
        screenshot "pure_separate_prompt_on_error=false" $action
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_separate_prompt_on_error=true" (
        set --universal pure_separate_prompt_on_error true
        set --global _pure_fresh_session false

        set --local action 'false; fish_prompt' # Simulate last command failure
        screenshot "pure_separate_prompt_on_error=true" $action
    ) $status -eq $SUCCESS

    # Single line prompt
    before_each
    @test "screenshot: pure_enable_single_line_prompt=false" (
        set --universal pure_enable_single_line_prompt false
        set --universal pure_enable_git true
        function _pure_prompt_git_dirty; echo '*'; end
        function _pure_prompt_git_pending_commits; echo '⇡'; end

        screenshot "pure_enable_single_line_prompt=false"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_enable_single_line_prompt=true" (
        set --universal pure_enable_single_line_prompt true
        set --universal pure_enable_git true
        function _pure_prompt_git_dirty; echo '*'; end
        function _pure_prompt_git_pending_commits; echo '⇡'; end

        screenshot "pure_enable_single_line_prompt=true"
    ) $status -eq $SUCCESS

    # System time
    before_each
    @test "screenshot: pure_show_system_time=false" (
        set --universal pure_show_system_time false

        screenshot "pure_show_system_time=false"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_show_system_time=true" (
        set --universal pure_show_system_time true

        screenshot "pure_show_system_time=true"
    ) $status -eq $SUCCESS

    # Subsecond command duration
    before_each
    @test "screenshot: pure_show_subsecond_command_duration=false" (
        set --universal pure_show_subsecond_command_duration false
        set --universal pure_threshold_command_duration 0
        set --global CMD_DURATION 6053  # 6.053 seconds in milliseconds

        screenshot "pure_show_subsecond_command_duration=false"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_show_subsecond_command_duration=true" (
        set --universal pure_show_subsecond_command_duration true
        set --universal pure_threshold_command_duration 0
        set --global CMD_DURATION 6053  # 6.053 seconds in milliseconds

        screenshot "pure_show_subsecond_command_duration=true"
    ) $status -eq $SUCCESS

    # VI mode symbol reversal
    before_each
    @test "screenshot: pure_reverse_prompt_symbol_in_vimode=false" (
        set --universal pure_reverse_prompt_symbol_in_vimode false
        set fish_key_bindings fish_vi_key_bindings

        screenshot "pure_reverse_prompt_symbol_in_vimode=false"
        
        set fish_key_bindings fish_default_key_bindings
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_reverse_prompt_symbol_in_vimode=true" (
        set --universal pure_reverse_prompt_symbol_in_vimode true
        set fish_key_bindings fish_default_key_bindings

        screenshot "pure_reverse_prompt_symbol_in_vimode=true"
    ) $status -eq $SUCCESS

    # Root prompt prefix
    before_each
    @test "screenshot: pure_show_prefix_root_prompt=false" (
        set --universal pure_show_prefix_root_prompt false
        function id; echo root; end  # mock root user

        screenshot "pure_show_prefix_root_prompt=false"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_show_prefix_root_prompt=true" (
        set --universal pure_show_prefix_root_prompt true
        set --universal pure_symbol_prefix_root_prompt "#"
        function id; echo root; end  # mock root user

        screenshot "pure_show_prefix_root_prompt=true"
    ) $status -eq $SUCCESS

    # Begin prompt with current directory
    before_each
    @test "screenshot: pure_begin_prompt_with_current_directory=false" (
        set --universal pure_begin_prompt_with_current_directory false
        set SSH_CONNECTION 127.0.0.1 56422 127.0.0.1 22  # Enable SSH to show the difference
        function id; echo testuser; end  # mock user

        screenshot "pure_begin_prompt_with_current_directory=false"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: pure_begin_prompt_with_current_directory=true" (
        set --universal pure_begin_prompt_with_current_directory true
        set SSH_CONNECTION 127.0.0.1 56422 127.0.0.1 22  # Enable SSH to show the difference
        function id; echo testuser; end  # mock user

        screenshot "pure_begin_prompt_with_current_directory=true"
    ) $status -eq $SUCCESS

    # SSH connection
    before_each
    @test "screenshot: ssh=disconnected" (
        set --erase SSH_CONNECTION
        set --universal pure_symbol_ssh_prefix ""

        screenshot "ssh=disconnected"
    ) $status -eq $SUCCESS

    before_each
    @test "screenshot: ssh=connected" (
        set SSH_CONNECTION 127.0.0.1 56422 127.0.0.1 22
        set --universal pure_symbol_ssh_prefix "🔗$SPACE"
        function id; echo testuser; end  # mock user

        screenshot "ssh=connected"
    ) $status -eq $SUCCESS
end
