source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_set_default.fish
@echo (_print_filename (status filename))


function before_all
    _purge_configs
    _disable_colors
end
before_all

@test "configure: pure_version" (
    set --erase pure_version
    source (status dirname)/../conf.d/pure.fish
    echo $pure_version
) != $EMPTY

@test "configure: pure_symbol_prompt" (
    set --erase pure_symbol_prompt
    source (status dirname)/../conf.d/pure.fish
    echo $pure_symbol_prompt
) = "❯"

@test "configure: pure_symbol_reverse_prompt" (
    set --erase pure_symbol_reverse_prompt
    source (status dirname)/../conf.d/pure.fish
    echo $pure_symbol_reverse_prompt
) = "❮"

@test "configure: pure_reverse_prompt_symbol_in_vimode" (
    set --erase pure_reverse_prompt_symbol_in_vimode
    source (status dirname)/../conf.d/pure.fish
    echo $pure_reverse_prompt_symbol_in_vimode
) = true

@test "configure: pure_enable_git" (
    set --erase pure_enable_git
    source (status dirname)/../conf.d/pure.fish
    echo $pure_enable_git
) = true

@test "configure: pure_symbol_git_unpulled_commits" (
    set --erase pure_symbol_git_unpulled_commits
    source (status dirname)/../conf.d/pure.fish
    echo $pure_symbol_git_unpulled_commits
) = "⇣"

@test "configure: pure_symbol_git_unpushed_commits" (
    set --erase pure_symbol_git_unpushed_commits
    source (status dirname)/../conf.d/pure.fish
    echo $pure_symbol_git_unpushed_commits
) = "⇡"

@test "configure: pure_symbol_git_dirty" (
    set --erase pure_symbol_git_dirty
    source (status dirname)/../conf.d/pure.fish
    echo $pure_symbol_git_dirty
) = "*"

@test "configure: pure_symbol_git_stash" (
    set --erase pure_symbol_git_stash
    source (status dirname)/../conf.d/pure.fish
    echo $pure_symbol_git_stash
) = "≡"

@test "configure: pure_symbol_title_bar_separator" (
    set --erase pure_symbol_title_bar_separator
    source (status dirname)/../conf.d/pure.fish
    echo $pure_symbol_title_bar_separator
) = -

@test "configure: pure_color_primary" (
    set --erase pure_color_primary
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_primary
) = blue

@test "configure: pure_color_info" (
    set --erase pure_color_info
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_info
) = cyan

@test "configure: pure_color_mute" (
    set --erase pure_color_mute
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_mute
) = brblack

@test "configure: pure_color_success" (
    set --erase pure_color_success
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_success
) = magenta

@test "configure: pure_color_normal" (
    set --erase pure_color_normal
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_normal
) = normal

@test "configure: pure_color_danger" (
    set --erase pure_color_danger
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_danger
) = red

@test "configure: pure_color_light" (
    set --erase pure_color_light
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_light
) = white

@test "configure: pure_color_warning" (
    set --erase pure_color_warning
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_warning
) = yellow

@test "configure: pure_color_command_duration" (
    set --erase pure_color_command_duration
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_command_duration
) = pure_color_warning

@test "configure: pure_color_current_directory" (
    set --erase pure_color_current_directory
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_current_directory
) = pure_color_primary

@test "configure: pure_color_git_unpushed_commits" (
    set --erase pure_color_git_unpushed_commits
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_git_unpushed_commits
) = pure_color_info

@test "configure: pure_color_git_unpulled_commits" (
    set --erase pure_color_git_unpulled_commits
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_git_unpulled_commits
) = pure_color_info

@test "configure: pure_color_git_branch" (
    set --erase pure_color_git_branch
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_git_branch
) = pure_color_mute

@test "configure: pure_color_git_dirty" (
    set --erase pure_color_git_dirty
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_git_dirty
) = pure_color_mute

@test "configure: pure_color_git_stash" (
    set --erase pure_color_git_stash
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_git_stash
) = pure_color_info

@test "configure: pure_color_hostname" (
    set --erase pure_color_hostname
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_hostname
) = pure_color_mute

@test "configure: pure_color_at_sign" (
    set --erase pure_color_at_sign
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_at_sign
) = pure_color_mute

@test "configure: pure_color_username_normal" (
    set --erase pure_color_username_normal
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_username_normal
) = pure_color_mute

@test "configure: pure_color_username_root" (
    set --erase pure_color_username_root
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_username_root
) = pure_color_light

@test "configure: pure_color_prompt_on_error" (
    set --erase pure_color_prompt_on_error
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_prompt_on_error
) = pure_color_danger

@test "configure: pure_color_prompt_on_success" (
    set --erase pure_color_prompt_on_success
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_prompt_on_success
) = pure_color_success

@test "configure: pure_show_jobs" (
    set --erase pure_show_jobs
    source (status dirname)/../conf.d/pure.fish
    echo $pure_show_jobs
) = false

@test "configure: pure_color_jobs" (
    set --erase pure_color_jobs
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_jobs
) = pure_color_normal

@test "configure: pure_show_system_time" (
    set --erase pure_show_system_time
    source (status dirname)/../conf.d/pure.fish
    echo $pure_show_system_time
) = false

@test "configure: pure_color_system_time" (
    set --erase pure_color_system_time
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_system_time
) = pure_color_mute

@test "configure: pure_enable_virtualenv" (
    set --erase pure_enable_virtualenv
    source (status dirname)/../conf.d/pure.fish
    echo $pure_enable_virtualenv
) = true

@test "configure: pure_symbol_virtualenv_prefix" (
    set --erase pure_symbol_virtualenv_prefix
    source (status dirname)/../conf.d/pure.fish
    echo $pure_symbol_virtualenv_prefix
) = $EMPTY

@test "configure: pure_color_virtualenv" (
    set --erase pure_color_virtualenv
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_virtualenv
) = pure_color_mute

@test "configure: pure_begin_prompt_with_current_directory" (
    set --erase pure_begin_prompt_with_current_directory
    source (status dirname)/../conf.d/pure.fish
    echo $pure_begin_prompt_with_current_directory
) = true

@test "configure: pure_separate_prompt_on_error" (
    set --erase pure_separate_prompt_on_error
    source (status dirname)/../conf.d/pure.fish
    echo $pure_separate_prompt_on_error
) = false

@test "configure: pure_threshold_command_duration" (
    set --erase pure_threshold_command_duration
    source (status dirname)/../conf.d/pure.fish
    echo $pure_threshold_command_duration
) = 5

@test "configure: pure_show_subsecond_command_duration" (
    set --erase pure_show_subsecond_command_duration
    source (status dirname)/../conf.d/pure.fish
    echo $pure_show_subsecond_command_duration
) = false

@test "configure: pure_color_command_duration" (
    set --erase pure_color_command_duration
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_command_duration
) = pure_color_warning

@test "configure: pure_check_for_new_release" (
    set --erase pure_check_for_new_release
    source (status dirname)/../conf.d/pure.fish
    echo $pure_check_for_new_release
) = false

@test "configure: pure_show_prefix_root_prompt" (
    set --erase pure_show_prefix_root_prompt
    source (status dirname)/../conf.d/pure.fish
    echo $pure_show_prefix_root_prompt
) = false

@test "configure: pure_symbol_prefix_root_prompt" (
    set --erase pure_symbol_prefix_root_prompt
    source (status dirname)/../conf.d/pure.fish
    echo $pure_symbol_prefix_root_prompt
) = '#'

@test "configure: pure_color_prefix_root_prompt" (
    set --erase pure_color_prefix_root_prompt
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_prefix_root_prompt
) = pure_color_danger

@test "configure: pure_enable_single_line_prompt" (
    set --erase pure_enable_single_line_prompt
    source (status dirname)/../conf.d/pure.fish
    echo $pure_enable_single_line_prompt
) = false

@test "configure: pure_enable_container_detection" (
    set --erase pure_enable_container_detection
    source (status dirname)/../conf.d/pure.fish
    echo $pure_enable_container_detection
) = true

@test "configure: pure_symbol_container_prefix" (
    set --erase pure_symbol_container_prefix
    source (status dirname)/../conf.d/pure.fish
    echo $pure_symbol_container_prefix
) = ""

@test "configure: pure_symbol_ssh_prefix" (
    set --erase pure_symbol_ssh_prefix
    source (status dirname)/../conf.d/pure.fish
    echo $pure_symbol_ssh_prefix
) = ""

@test "configure: pure_enable_k8s" (
    set --erase pure_enable_k8s
    source (status dirname)/../conf.d/pure.fish
    echo $pure_enable_k8s
) = false

@test "configure: pure_symbol_k8s_prefix" (
    set --erase pure_symbol_k8s_prefix
    source (status dirname)/../conf.d/pure.fish
    echo $pure_symbol_k8s_prefix
) = "☸"

@test "configure: pure_color_k8s_context" (
    set --erase pure_color_k8s_context
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_k8s_context
) = pure_color_success

@test "configure: pure_color_k8s_namespace" (
    set --erase pure_color_k8s_namespace
    source (status dirname)/../conf.d/pure.fish
    echo $pure_color_k8s_namespace
) = pure_color_primary
