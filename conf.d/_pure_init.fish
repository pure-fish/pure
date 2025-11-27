# Deactivate the default virtualenv prompt so that we can add our own
set --global --export VIRTUAL_ENV_DISABLE_PROMPT 1

# Whether or not is a fresh session
set --global _pure_fresh_session true

# Register `_pure_prompt_new_line` as an event handler for `fish_prompt`
for fpath in $fish_function_path

    test -e $fpath/_pure_prompt_new_line.fish && source $fpath/_pure_prompt_new_line.fish
end

function _pure_uninstall --on-event pure_uninstall \
    --description 'Fisher handler to uninstall pure prompt'

    rm -f $__fish_config_dir/conf.d/pure.fish

    # backup fish_prompt and fish_title to default
    cp $__fish_config_dir/functions/fish_prompt{,.pure-backup}.fish
    cp $__fish_config_dir/functions/fish_title{,.pure-backup}.fish

    # erase existing fish_prompt and fish_title to default
    functions --erase fish_prompt
    functions --erase fish_title

    # restore fish_prompt and fish_title to default
    # reload them into active session
    # To remain compatible with both single-binary fish and traditional installations
    # https://github.com/fish-shell/fish-shell/issues/11429#issuecomment-2834407208
    if status list-files functions/fish_prompt.fish >/dev/null # standalone binary Fish ≥4.1.2
        status get-file functions/fish_prompt.fish \
            | tee $__fish_config_dir/functions/fish_prompt.fish \
            | source
        status get-file functions/fish_title.fish \
            | tee $__fish_config_dir/functions/fish_title.fish \
            | source
    else # traditional installation
        cat $__fish_data_dir/functions/fish_prompt.fish \
            | tee $__fish_config_dir/functions/fish_prompt.fish \
            | source
        cat $__fish_data_dir/functions/fish_title.fish \
            | tee $__fish_config_dir/functions/fish_title.fish \
            | source
    end

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
        rm -f $file
    end
end
