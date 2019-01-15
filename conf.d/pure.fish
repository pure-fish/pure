set --universal pure_version 1.13.0

# Whether or not is a fresh session
set --global _pure_fresh_session true

# Deactivate the default virtualenv prompt so that we can add our own
set --global --export VIRTUAL_ENV_DISABLE_PROMPT 1

# Symbols
_pure_set_default pure_symbol_prompt "❯"

# Git
_pure_set_default pure_symbol_git_arrow_down "⇣"
_pure_set_default pure_symbol_git_arrow_up "⇡"
_pure_set_default pure_symbol_git_dirty "*"

# Title
_pure_set_default pure_symbol_horizontal_bar "—"

# Base colors
_pure_set_default pure_color_primary (set_color blue)
_pure_set_default pure_color_info (set_color cyan)
_pure_set_default pure_color_mute (set_color brblack)
_pure_set_default pure_color_success (set_color magenta)
_pure_set_default pure_color_normal (set_color normal)
_pure_set_default pure_color_danger (set_color red)
_pure_set_default pure_color_light (set_color white)
_pure_set_default pure_color_warning (set_color yellow)
_pure_set_default pure_color_dark (set_color black)

# Colors used on symbols, attributes and events
_pure_set_default pure_color_command_duration $pure_color_warning
_pure_set_default pure_color_current_folder $pure_color_primary
_pure_set_default pure_color_git_arrows $pure_color_info
_pure_set_default pure_color_git_branch $pure_color_mute
_pure_set_default pure_color_git_dirty $pure_color_mute
_pure_set_default pure_color_ssh_host $pure_color_mute
_pure_set_default pure_color_ssh_separator $pure_color_mute
_pure_set_default pure_color_ssh_user_normal $pure_color_mute
_pure_set_default pure_color_ssh_user_root $pure_color_light
_pure_set_default pure_color_prompt_on_error $pure_color_danger
_pure_set_default pure_color_symbol_success $pure_color_success
_pure_set_default pure_color_virtualenv $pure_color_mute

# Print current working directory at the beginning of prompt
# true (default):   current directory, git, user@hostname (ssh-only), command duration
# false:            user@hostname (ssh-only), current directory, git, command duration
_pure_set_default pure_prompt_begin_with_current_directory true

# Show exit code of last command as a separate prompt character (cf. https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character)
# false - single prompt character, default
# true - separate prompt character
_pure_set_default pure_separate_prompt_on_error false

# Max execution time of a process before its run time is shown when it exits
_pure_set_default pure_command_max_exec_time 5

# Right Prompt variables
_pure_set_default pure_right_prompt ""
_pure_set_default pure_color_right_prompt $pure_color_normal
