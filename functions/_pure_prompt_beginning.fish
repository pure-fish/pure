function _pure_prompt_beginning
    # Clear existen line content
    set --local clear_line "\r\033[K"

    echo $clear_line
end
