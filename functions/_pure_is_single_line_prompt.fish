function _pure_is_single_line_prompt \
    --description 'Test if single line prompt feature is enabled'
    set --query pure_enable_single_line_prompt
    and test "$pure_enable_single_line_prompt" = true
end
