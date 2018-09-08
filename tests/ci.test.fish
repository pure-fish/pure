function setup
    docker pull edouardlopez/pure-fish

test "install manually (default behaviour of `docker-pure-fish`)"
    'version' = (
        docker run \
            --name pure \
            --rm \
            --tty \
        edouardlopez/pure-fish 'fish --version' \
        | grep --only-matching 'version'
    )
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
