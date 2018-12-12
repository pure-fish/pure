# Pure
# by Rafael Rinaldi
# https://github.com/rafaelrinaldi/pure
# MIT License

# Whether or not is a fresh session
set -g _pure_fresh_session 1

# Deactivate the default virtualenv prompt so that we can add our own
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# Symbols

_pure_set_default pure_symbol_prompt "❯"
_pure_set_default pure_symbol_git_down_arrow "⇣"
_pure_set_default pure_symbol_git_up_arrow "⇡"
_pure_set_default pure_symbol_git_dirty "*"
_pure_set_default pure_symbol_horizontal_bar "—"

# Colors

_pure_set_default pure_color_red (set_color red)
_pure_set_default pure_color_green (set_color green)
_pure_set_default pure_color_blue (set_color blue)
_pure_set_default pure_color_yellow (set_color yellow)
_pure_set_default pure_color_cyan (set_color cyan)
_pure_set_default pure_color_gray (set_color 93A1A1)
_pure_set_default pure_color_normal (set_color normal)

_pure_set_default pure_username_color $pure_color_gray
_pure_set_default pure_host_color $pure_color_gray
_pure_set_default pure_root_color $pure_color_normal

# Determines whether the username and host are shown at the begining or end
# 0 - end of prompt, default
# 1 - start of prompt
# Any other value defaults to the default behaviour
_pure_set_default pure_user_host_location 0

# Show exit code of last command as a separate prompt character. As described here: https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character
# 0 - single prompt character, default
# 1 - separate prompt character
# Any other value defaults to the default behaviour
_pure_set_default pure_separate_prompt_on_error 0

# Max execution time of a process before its run time is shown when it exits
_pure_set_default pure_command_max_exec_time 5
