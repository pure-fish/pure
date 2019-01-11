docker pull edouardlopez/pure-fish

test "install manually (default behaviour of `docker-pure-fish`)"
    'version' = (
	docker run \
		--name run-pure-on-$FISH_VERSION \
		--rm \
		--interactive \
		--tty \
		--volume=(pwd):/tmp/.pure/ \
		pure-on-fish-$FISH_VERSION '
            curl git.io/pure-fish --output /tmp/pure_installer.fish --location --silent
            source /tmp/pure_installer.fish
            and install_pure
            fish_prompt
        ' \
        | tee | grep --count '❯' 
    )
end

test "install with fisher"
    'Done' = (
        docker run \
            --name run-pure-on-$FISH_VERSION \
            --rm \
            --interactive \
            --tty \
            --volume=(pwd):/tmp/.pure/ \
            pure-on-fish-$FISH_VERSION 'fisher rafaelrinaldi/pure' \
        | grep --only-matching 'Done'
    )
end

test "install with OMF (Oh-My-Fish!)"
    'pure successfully installed' = (
        docker run \
            --name run-pure-on-$FISH_VERSION \
            --rm \
            --interactive \
            --tty \
            --volume=(pwd):/tmp/.pure/ \
            pure-on-fish-$FISH_VERSION '
                cd $HOME;
                rm -rf $HOME/.config/fish/functions/theme-pure;
                curl -L https://get.oh-my.fish > /tmp/install;
                chmod u+x /tmp/install;
                /tmp/install --noninteractive;
                fish -c "omf install pure"
        ' | grep --only-matching 'pure successfully installed'
    )
end

test "install with Fundle"
    'Installing rafaelrinaldi/pure' = (
        docker run \
            --name run-pure-on-$FISH_VERSION \
            --rm \
            --interactive \
            --tty \
            --volume=(pwd):/tmp/.pure/ \
            pure-on-fish-$FISH_VERSION '
                mkdir -p ~/.config/fish/functions;
                wget https://git.io/fundle -O ~/.config/fish/functions/fundle.fish;
                fundle plugin rafaelrinaldi/pure;
                fundle install;
                fundle list -s
        ' | grep --only-matching 'Installing rafaelrinaldi/pure'
    )
end
