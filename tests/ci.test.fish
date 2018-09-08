function setup
    docker pull edouardlopez/pure-fish
end

begin
    set -l IFS
    set fisher_install (
        docker run \
            --name pure \
            --rm \
            --tty \
        edouardlopez/pure-fish 'fisher rafaelrinaldi/pure'
    )
    echo $fisher_install
end

test "install with fisher"
    'Done' = (
        echo $fisher_install | grep --only-matching 'Done'
        )
end


