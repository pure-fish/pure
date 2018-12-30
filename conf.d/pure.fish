# Whether or not is a fresh session
set -g _pure_fresh_session true

# Deactivate the default virtualenv prompt so that we can add our own
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# Symbols
_pure_set_default pure_symbol_prompt "❯"

# Git
_pure_set_default pure_symbol_git_down_arrow "⇣"
_pure_set_default pure_symbol_git_up_arrow "⇡"
_pure_set_default pure_symbol_git_dirty "*"

# Title
_pure_set_default pure_symbol_horizontal_bar "—"

# Colors
_pure_set_default pure_color_red (set_color red)
_pure_set_default pure_color_green (set_color green)
_pure_set_default pure_color_blue (set_color blue)
_pure_set_default pure_color_magenta (set_color magenta)
_pure_set_default pure_color_yellow (set_color yellow)
_pure_set_default pure_color_cyan (set_color cyan)
_pure_set_default pure_color_gray (set_color 93A1A1)
_pure_set_default pure_color_normal (set_color normal)

_pure_set_default pure_username_color $pure_color_gray
_pure_set_default pure_host_color $pure_color_gray
_pure_set_default pure_root_color $pure_color_normal

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
