function _pure_set_default -S
    set --local scope "--global"
    set --local var $argv[1]
    set --local default $argv[2]

    if test (count $argv) -eq 3
        set scope $argv[1]
        set var $argv[2]
        set default $argv[3]
    end

    if not set -q $var
        set $scope $var $default
    end
end
