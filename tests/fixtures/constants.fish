set --global SUCCESS 0
set --global FAILURE 1
set --global IS_PRESENT 1 # when using grep
set --global EMPTY ''
set --global NONE 0
set --global SPACE ' '

function _purge_configs --description "Erase all existing pure configurations"
    for variable in (set --names | grep pure_)
        set --erase --local $variable
        set --erase --global $variable
        set --erase --universal $variable
    end
end

function _disable_colors --description "Set all color to empty value"
    for color_config in (set --names | grep pure_color_)
        set --global $color_config $EMPTY
    end
end

function _print_filename --argument-names filename
    echo (set_color cyan)$filename(set_color normal)
end
