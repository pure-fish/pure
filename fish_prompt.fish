# Pure
# by Rafael Rinaldi
# https://github.com/rafaelrinaldi/pure
# MIT License

function fish_prompt
    # Save previous exit code
    set --local exit_code $status
    # Prepare line for prompt
    echo -e -n (__pure_new_line)
    # Print pre prompt
    echo -e (__pure_pre_prompt)
    # Print prompt
    echo -e -n (__pure_prompt $exit_code)
    # Reset colors and end prompt
    echo -e (__pure_end_prompt)
    
    set __pure_fresh_session 0
end
