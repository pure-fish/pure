test "install manually (default behaviour of `docker-pure-fish`)"
    (
	docker run \
		--name run-pure-on-$FISH_VERSION \
		--rm \
		--interactive \
		--volume=(pwd):/tmp/.pure/ \
		pure-on-fish-$FISH_VERSION '
            curl git.io/pure-fish --output /tmp/pure_installer.fish --location --silent
            source /tmp/pure_installer.fish
            and install_pure
            fish_prompt
        '\
        | tee /dev/tty | grep --count '❯' 
    ) = 1
end

test "install with fisher"
    (
        docker run \
            --name run-pure-on-$FISH_VERSION \
            --rm \
            --interactive \
            --volume=(pwd):/tmp/.pure/ \
            pure-on-fish-$FISH_VERSION '
                fisher add rafaelrinaldi/pure
                fish_prompt
            '\
        | tee /dev/tty | grep --count '❯' 
    ) = 1
end

test "install with OMF (Oh-My-Fish!)"
    (
        docker run \
            --name run-pure-on-$FISH_VERSION \
            --rm \
            --interactive \
            --volume=(pwd):/tmp/.pure/ \
            pure-on-fish-$FISH_VERSION '
                curl -L https://get.oh-my.fish > install
                fish install --noninteractive
                fish -c "omf install pure; fish_prompt"
            '\
        | tee /dev/tty | grep --count '❯' 
    ) = 1
end

test "install with Fundle"
    (
        docker run \
            --name run-pure-on-$FISH_VERSION \
            --rm \
            --interactive \
            --volume=(pwd):/tmp/.pure/ \
            pure-on-fish-$FISH_VERSION '
                mkdir -p ~/.config/fish/functions
                wget https://git.io/fundle -O ~/.config/fish/functions/fundle.fish
                fundle plugin rafaelrinaldi/pure
                fundle install
                fish_prompt
            '\
        | tee /dev/tty | grep --count '❯' 
    ) = 1
end
