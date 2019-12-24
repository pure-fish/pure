set --universal pure_version 2.4.3 # used for bug report

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
_pure_set_default pure_symbol_reverse_prompt "❮"  # used for VI mode

# Git
_pure_set_default pure_enable_git true
_pure_set_default pure_symbol_git_unpulled_commits "⇣"
_pure_set_default pure_symbol_git_unpushed_commits "⇡"
_pure_set_default pure_symbol_git_dirty "*"

# Number of running jobs
_pure_set_default pure_show_jobs false

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

# VI mode indicator
# true (default):  indicate a non-insert mode by reversing the prompt symbol (❮)
# false:           indicate vi mode with [I], [N], [V]
_pure_set_default pure_reverse_prompt_symbol_in_vimode true

# Title
_pure_set_default pure_symbol_title_bar_separator "—"
