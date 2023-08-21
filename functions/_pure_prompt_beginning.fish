function _pure_prompt_beginning \
    --description 'Clear existing line content'

    set --local clear_line "\r\033[K"

    echo $clear_line
end
