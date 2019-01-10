function is_lower_than_equal
    set lowest (printf "$argv[1]\n$argv[2]" | sort --version-sort | head -n1)
    test $argv[1] = $lowest
end

function is_lower_than
    if test $argv[1] = $argv[2]
     return 1
    else
        is_lower_than_equal $argv[1] $argv[2]
    end
end

function fish_version_below --argument-names version
    is_lower_than $FISH_VERSION $version
end

function fish_version_at_least --argument-names version
    if test (fish_version_below $version)
        return 1
    else 
        return 0
    end
end