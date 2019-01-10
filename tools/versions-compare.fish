set --global fail 1
set --global success 0

function is_lower_than_equal
    set lowest (printf "$argv[1]\n$argv[2]" | sort --version-sort | head -n1)
    test $argv[1] = $lowest
end

function is_lower_than
    if test $argv[1] = $argv[2]
        return $fail
    else
        is_lower_than_equal $argv[1] $argv[2]
    end
end

function fish_version_below \
    --description 'True if $FISH_VERSION is lower than submitted version. Targeted to be used in test, hence the `printf`.' \
    --argument-names version
    
    if test (is_lower_than $FISH_VERSION $version)
        printf  "[fish <%s]" $version
        return $success
    else
        printf  "[fish ≥%s]" $version
        return $fail
    end
end

function fish_version_at_least \
    --description 'True if $FISH_VERSION is greater or equal than submitted version. Targeted to be used in test, hence the `printf`.' \
    --argument-names version
    
    if test (fish_version_below $version >/dev/null)
        printf  "[fish ≥%s]" $version
        return $fail
    else 
        printf  "[fish <%s]" $version
        return $success
    end
end