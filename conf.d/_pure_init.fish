# Deactivate the default virtualenv prompt so that we can add our own
set --global --export VIRTUAL_ENV_DISABLE_PROMPT 1

# Whether or not is a fresh session
set --global _pure_fresh_session true

# Register `_pure_prompt_new_line` as an event handler for `fish_prompt`
for fpath in $fish_function_path
    test -e $fpath/_pure_prompt_new_line.fish && source $fpath/_pure_prompt_new_line.fish
end

function _pure \
    --description 'Display branding for pure prompt'

    printf "%s %s" \
        (set_color $pure_color_warning)$pure_symbol_prompt$pure_symbol_reverse_prompt$pure_symbol_prompt \
        (set_color $pure_color_primary)"pure"(set_color normal)
end

function _pure_install --on-event pure_install \
    --description 'Fisher handler when pure prompt is installed'
    
    source $__fish_config_dir/conf.d/pure.fish
    
    printf "Now using: %s %s\n" \
        (_pure) \
        (set_color --bold $pure_color_success)$pure_version(set_color normal)
end

# Fisher emit an event for all files under conf.d/. 
# We listen to the event when the new conf.d/_pure_init.fish is sourced,
# to read old `pure_version` before sourcing conf.d/pure.fish happens.
function _pure_update --on-event _pure_init_update \
    --description 'Fisher handler pure prompt is updated'
    
    set --local previous_version $pure_version
    source $__fish_config_dir/conf.d/pure.fish

    printf "Updating: %s %s → %s\n" \
        (_pure) \
        (set_color $pure_color_info)$previous_version(set_color normal) \
        (set_color --bold $pure_color_success)$pure_version(set_color normal)
end

function _pure_uninstall --on-event pure_uninstall \
    --description 'Fisher handler pure prompt is uninstalled'

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
