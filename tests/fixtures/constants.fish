source (status dirname)/../mocks/spectra.fish

set --global SUCCESS 0
set --global FAILURE 1
set --global IS_PRESENT 1 # when using grep
set --global ABORT_FEATURE 2
set --global EMPTY ''
set --global NONE 0
set --global SPACE ' '
set --global PURE_CONFIG_VERSION_REGEX '(?<=pure_version )(?<value>[^\s#]+)'
set --global PURE_VERSION_NUMBER_REGEX '(\d+.\d+.\d+)$'

function is_tests_runner \
    --description "Detect Linux test container run with `nemo` user, other OSes we use the test directory /tmp/.pure/"

    test "$CI" = true \
        -o "$USER" = nemo \
        -o "$PWD" = "/tmp/.pure/" \
        -o "$PWD" = /tmp/pure \
        -o "$PWD" = "/home/nemo/.config/fish/pure"
end

function _purge_configs \
    --description "Erase all existing pure configurations, to avoid unwanted side-effect"

    if is_tests_runner # avoid destroying other user's configuration
        for variable in (set --names | string match --regex --entire '^pure_')
            set --erase --local $variable
            set --erase --global $variable
            set --erase --universal $variable
        end
    end
    set --erase --universal fish_transient_prompt
end

function _disable_all_configs \
    --description "Disable all existing pure configurations. Useful in tests to focus on a single feature at a time."

    if is_tests_runner # avoid destroying other user's configuration
        for variable in (set --names | string match --regex --entire '^pure_(check|enable|reverse|separate|show)_.+')
            if set --query $variable
                set --erase --local $variable
                set --erase --global $variable
                set --erase --universal $variable
                set --universal $variable false
            end
        end
    end
end

function _disable_colors \
    --description "Set all color to empty value, to avoid unwanted side-effect"

    if is_tests_runner # avoid destroying other user's configuration
        for color_config in (set --names | string match --regex --entire '^pure_color_')
            set --universal $color_config $EMPTY
        end
    end
    _mock _pure_set_color
end

function _print_filename --argument-names filename
    echo (set_color cyan)$filename(set_color normal)
end
