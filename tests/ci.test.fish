function setup
    docker pull edouardlopez/pure-fish
end

test "install with fisher"
    'Done' = (
        docker run \
            --name pure \
            --rm \
            --tty \
        edouardlopez/pure-fish 'fisher rafaelrinaldi/pure' \
        | grep --only-matching 'Done'
    )
end
