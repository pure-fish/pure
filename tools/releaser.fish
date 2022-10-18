function releaser \
    --description "create project's release on Github" \
    --argument-names new_version

    if test -n "$new_version"
        bump_version $new_version
        commit $new_version
    else
        echo "missing argument: \$new_version"
        return 1
    end
end

function bump_version \
    --description "Bump version number in config file" \
    --argument-names new_version

    set --local matcher 'pure_version [0-9]+\.[0-9]+\.[0-9]+'
    set --local replacement "pure_version $new_version"
    sed -E "s/$matcher/$replacement/" ./conf.d/pure.fish >./conf.d/pure.fish.new
    cp ./conf.d/pure.fish{.new,}
end


function commit \
    --description "Commit new version number in git" \
    --argument-names new_version

    git add ./conf.d/pure.fish
    git commit \
        --quiet \
        --message "chore: bump version $new_version"
end
