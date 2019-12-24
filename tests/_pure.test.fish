source $current_dirname/../functions/_pure_set_default.fish

set --local empty ''

@test "configure: pure_version"  (
    set --erase pure_version
    source $current_dirname/../conf.d/pure.fish
    echo $pure_version
) != $empty

@test "configure: pure_symbol_prompt"  (
    set --erase pure_symbol_prompt
    source $current_dirname/../conf.d/pure.fish
    echo $pure_symbol_prompt
) = "❯"

@test "configure: pure_symbol_reverse_prompt"  (
    set --erase pure_symbol_reverse_prompt
    source $current_dirname/../conf.d/pure.fish
    echo $pure_symbol_reverse_prompt
) = "❮"

@test "configure: pure_reverse_prompt_symbol_in_vimode" (
    set --erase pure_reverse_prompt_symbol_in_vimode
    source $current_dirname/../conf.d/pure.fish
    echo $pure_reverse_prompt_symbol_in_vimode
) = true

@test "configure: pure_symbol_git_unpulled_commits"  (
    set --erase pure_symbol_git_unpulled_commits
    source $current_dirname/../conf.d/pure.fish
    echo $pure_symbol_git_unpulled_commits
) = "⇣"

@test "configure: pure_symbol_git_unpushed_commits"  (
    set --erase pure_symbol_git_unpushed_commits
    source $current_dirname/../conf.d/pure.fish
    echo $pure_symbol_git_unpushed_commits
) = "⇡"

@test "configure: pure_symbol_git_dirty"  (
    set --erase pure_symbol_git_dirty
    source $current_dirname/../conf.d/pure.fish
    echo $pure_symbol_git_dirty
) = "*"

@test "configure: pure_symbol_title_bar_separator"  (
    set --erase pure_symbol_title_bar_separator
    source $current_dirname/../conf.d/pure.fish
    echo $pure_symbol_title_bar_separator
) = "—"

@test "configure: pure_color_primary"  (
    set --erase pure_color_primary
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_primary
) = blue

@test "configure: pure_color_info"  (
    set --erase pure_color_info
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_info
) = cyan

@test "configure: pure_color_mute"  (
    set --erase pure_color_mute
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_mute
) = brblack

@test "configure: pure_color_success"  (
    set --erase pure_color_success
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_success
) = magenta

@test "configure: pure_color_normal"  (
    set --erase pure_color_normal
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_normal
) = normal

@test "configure: pure_color_danger"  (
    set --erase pure_color_danger
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_danger
) = red

@test "configure: pure_color_light"  (
    set --erase pure_color_light
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_light
) = white

@test "configure: pure_color_warning"  (
    set --erase pure_color_warning
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_warning
) = yellow

@test "configure: pure_color_command_duration"  (
    set --erase pure_color_command_duration
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_command_duration
) = pure_color_warning

@test "configure: pure_color_current_directory"  (
    set --erase pure_color_current_directory
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_current_directory
) = pure_color_primary

@test "configure: pure_color_git_unpushed_commits"  (
    set --erase pure_color_git_unpushed_commits
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_git_unpushed_commits
) = pure_color_info

@test "configure: pure_color_git_unpulled_commits"  (
    set --erase pure_color_git_unpulled_commits
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_git_unpulled_commits
) = pure_color_info

@test "configure: pure_color_git_branch"  (
    set --erase pure_color_git_branch
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_git_branch
) = pure_color_mute

@test "configure: pure_color_git_dirty"  (
    set --erase pure_color_git_dirty
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_git_dirty
) = pure_color_mute

@test "configure: pure_color_ssh_hostname"  (
    set --erase pure_color_ssh_hostname
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_ssh_hostname
) = pure_color_mute

@test "configure: pure_color_ssh_separator"  (
    set --erase pure_color_ssh_separator
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_ssh_separator
) = pure_color_mute

@test "configure: pure_color_ssh_user_normal"  (
    set --erase pure_color_ssh_user_normal
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_ssh_user_normal
) = pure_color_mute

@test "configure: pure_color_ssh_user_root"  (
    set --erase pure_color_ssh_user_root
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_ssh_user_root
) = pure_color_light

@test "configure: pure_color_prompt_on_error"  (
    set --erase pure_color_prompt_on_error
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_prompt_on_error
) = pure_color_danger

@test "configure: pure_color_prompt_on_success"  (
    set --erase pure_color_prompt_on_success
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_prompt_on_success
) = pure_color_success

@test "configure: pure_color_jobs"  (
    set --erase pure_color_jobs
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_jobs
) = pure_color_normal

@test "configure: pure_color_virtualenv"  (
    set --erase pure_color_virtualenv
    source $current_dirname/../conf.d/pure.fish
    echo $pure_color_virtualenv
) = pure_color_mute

@test "configure: pure_begin_prompt_with_current_directory"  (
    set --erase pure_begin_prompt_with_current_directory
    source $current_dirname/../conf.d/pure.fish
    echo $pure_begin_prompt_with_current_directory
) = true

@test "configure: pure_separate_prompt_on_error"  (
    set --erase pure_separate_prompt_on_error
    source $current_dirname/../conf.d/pure.fish
    echo $pure_separate_prompt_on_error
) = false

@test "configure: pure_threshold_command_duration"  (
    set --erase pure_threshold_command_duration
    source $current_dirname/../conf.d/pure.fish
    echo $pure_threshold_command_duration
) = 5
