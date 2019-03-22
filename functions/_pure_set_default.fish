function _pure_set_default -S -a scope var default
    if not set -q $var
        set $scope $var $default
    end
end
