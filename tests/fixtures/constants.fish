set --global SUCCESS 0
set --global FAILURE 1
set --global IS_PRESENT 1 # when using grep
set --global EMPTY ''
set --global NONE 0
set --global SPACE ' '

function _purge_configs --description "Erase all existing pure configurations"
end

function _disable_colors --description "Set all color to empty value"
    function _pure_set_color; end
end

function _print_filename --argument-names filename
    echo (set_color cyan)$filename(set_color normal)
end
