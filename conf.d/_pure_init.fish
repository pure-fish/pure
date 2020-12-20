# Deactivate the default virtualenv prompt so that we can add our own
set --global --export VIRTUAL_ENV_DISABLE_PROMPT 1

# Whether or not is a fresh session
set --global _pure_fresh_session true

# Register `_pure_prompt_new_line` as an event handler fot `fish_prompt`
functions --query _pure_prompt_new_line

source (realpath (status --current-filename)/../../functions/_pure_uninstall.fish)
