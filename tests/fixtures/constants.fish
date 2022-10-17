set --global SUCCESS 0
set --global FAILURE 1
set --global IS_PRESENT 1 # when using grep
set --global EMPTY ''
set --global NONE 0
set --global SPACE ' '
set --global PURE_CONFIG_VERSION_REGEX '(?<=pure_version )(?<value>[^\s#]+)'
set --global PURE_VERSION_NUMBER_REGEX '(\d+.\d+.\d+)$'

function _purge_configs --description "Erase all existing pure configurations, to avoid unwanted side-effect"
    if test "$USER" = 'nemo'
        for variable in (set --names | string match --regex --entire '^pure_')
            set --erase --local $variable
            set --erase --global $variable
            set --erase --universal $variable
        end
    end
end

function _disable_colors --description "Set all color to empty value, to avoid unwanted side-effect"
    if test "$USER" = 'nemo'
        for color_config in (set --names | string match --regex --entire '^pure_color_')
            set --universal $color_config $EMPTY
        end
        function _pure_set_color; echo; end
    end
end

function _print_filename --argument-names filename
    echo (set_color cyan)$filename(set_color normal)
end

function _has_called \
    --description "check spy method XYZ write to the /tmp/called file when called" \
    --argument-names spy # name of the method

    if test -r /tmp/called
        grep -c -q "$spy" /tmp/called \
        || echo 'DEBUG: '(status function)': '(cat /tmp/called) # check spy was called
    else
        return $FAILURE
    end
end
