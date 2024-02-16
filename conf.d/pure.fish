set --global pure_version 4.11.0 # For bug report and tag-after-merge workflow

# Base colors
_pure_set_default pure_color_primary blue
_pure_set_default pure_color_info cyan
_pure_set_default pure_color_mute brblack
_pure_set_default pure_color_success magenta
_pure_set_default pure_color_normal normal
_pure_set_default pure_color_danger red
_pure_set_default pure_color_light white
_pure_set_default pure_color_warning yellow
_pure_set_default pure_color_dark black

# Prompt
_pure_set_default pure_symbol_prompt "❯"
_pure_set_default pure_symbol_reverse_prompt "❮" # used for VI mode
_pure_set_default pure_color_prompt_on_error pure_color_danger
_pure_set_default pure_color_prompt_on_success pure_color_success

# Current Working Directory
_pure_set_default pure_color_current_directory pure_color_primary
_pure_set_default pure_shorten_prompt_current_directory_length 0
_pure_set_default pure_truncate_prompt_current_directory_keeps -1

# Git
_pure_set_default pure_enable_git true
_pure_set_default pure_symbol_git_unpulled_commits "⇣"
_pure_set_default pure_symbol_git_unpushed_commits "⇡"
_pure_set_default pure_symbol_git_dirty "*"
_pure_set_default pure_symbol_git_stash "≡"
_pure_set_default pure_color_git_unpulled_commits pure_color_info
_pure_set_default pure_color_git_unpushed_commits pure_color_info
_pure_set_default pure_color_git_branch pure_color_mute
_pure_set_default pure_color_git_dirty pure_color_mute
_pure_set_default pure_color_git_stash pure_color_info

# Remote info (user@hostname) for SSH and containers (Docker/LXC)
_pure_set_default pure_color_hostname pure_color_mute
_pure_set_default pure_color_at_sign pure_color_mute
_pure_set_default pure_color_username_normal pure_color_mute
_pure_set_default pure_color_username_root pure_color_light

# Number of running jobs
_pure_set_default pure_show_jobs false
_pure_set_default pure_color_jobs pure_color_normal

# Show system time
_pure_set_default pure_show_system_time false
_pure_set_default pure_color_system_time pure_color_mute

# Nix build environment
_pure_set_default pure_enable_nixdevshell false
_pure_set_default pure_symbol_nixdevshell_prefix "❄️" # otherwise nerdfonts: '󱄅' or ''
_pure_set_default pure_color_nixdevshell_prefix pure_color_info
_pure_set_default pure_color_nixdevshell_symbol pure_color_mute

#  env for Python
_pure_set_default pure_enable_virtualenv true
_pure_set_default pure_symbol_virtualenv_prefix "" # 🐍
_pure_set_default pure_color_virtualenv pure_color_mute

# AWS profile name
_pure_set_default pure_enable_aws_profile true
_pure_set_default pure_symbol_aws_profile_prefix "" # ☁️
_pure_set_default pure_color_aws_profile pure_color_warning

# Print current working directory at the beginning of prompt
# true (default):   current directory, git, user@hostname (ssh-only), command duration
# false:            user@hostname (ssh-only), current directory, git, command duration
_pure_set_default pure_begin_prompt_with_current_directory true

# Show exit code of last command as a separate prompt character (cf. https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character)
# false - single prompt character, default
# true - separate prompt character
_pure_set_default pure_separate_prompt_on_error false

# Max execution time of a process before its run time is shown when it exits
_pure_set_default pure_threshold_command_duration 5
_pure_set_default pure_show_subsecond_command_duration false
_pure_set_default pure_color_command_duration pure_color_warning

# VI mode indicator
# true (default):  indicate a non-insert mode by reversing the prompt symbol (❮)
# false:           indicate vi mode with [I], [N], [V]
_pure_set_default pure_reverse_prompt_symbol_in_vimode true

# Title
_pure_set_default pure_symbol_title_bar_separator -
_pure_set_default pure_shorten_window_title_current_directory_length 0
_pure_set_default pure_truncate_window_title_current_directory_keeps -1

# Check for new release on startup
_pure_set_default pure_check_for_new_release false

# Prefix prompt when logged in as root
_pure_set_default pure_show_prefix_root_prompt false
_pure_set_default pure_symbol_prefix_root_prompt "#"
_pure_set_default pure_color_prefix_root_prompt pure_color_danger

# Compact mode
_pure_set_default pure_enable_single_line_prompt false

# Detect when running in container (e.g. docker, podman, LXC/LXD)
_pure_set_default pure_enable_container_detection true
_pure_set_default pure_symbol_container_prefix "" # suggestion: '🐋' or '📦'

# Detect when running in SSH
_pure_set_default pure_symbol_ssh_prefix "" # suggestion: 'ssh:/' or '🔗🔐🔒🌐'

# Display Kubernetes/k8s context and namespace
_pure_set_default pure_enable_k8s false
_pure_set_default pure_symbol_k8s_prefix "☸" # ☸️
_pure_set_default pure_color_k8s_prefix pure_color_info
_pure_set_default pure_color_k8s_context pure_color_success
_pure_set_default pure_color_k8s_namespace pure_color_primary
