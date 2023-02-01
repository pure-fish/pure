# Deactivate the default virtualenv prompt so that we can add our own
set --global --export VIRTUAL_ENV_DISABLE_PROMPT 1

# Whether or not is a fresh session
set --global _pure_fresh_session true

# Register `_pure_prompt_new_line` as an event handler fot `fish_prompt`
functions --query _pure_prompt_new_line

function _pure_uninstall --on-event pure_uninstall
    # erase _pure* variables
    set --names \
        | string replace --filter --regex '(^_?pure)' 'set --erase $1' \
        | source
    # erase _pure* functions
    functions --names --all \
        | string replace --filter --regex '(^_?pure)' 'functions --erase $1' \
        | source
    # delete _pure* files
    for file in $__fish_config_dir/{functions,conf.d}/_pure_*
        rm $file
    end
    # restore fish_prompt to default
    cp {$__fish_data_dir,$__fish_config_dir}/functions/fish_prompt.fish
end
