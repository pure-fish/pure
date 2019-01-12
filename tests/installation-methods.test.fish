if test $USER = 'nemo'
    test "installation methods: manually"
        (
            curl git.io/pure-fish --output /tmp/pure_installer.fish --location --silent >/dev/null
            source /tmp/pure_installer.fish
            and install_pure >/dev/null
            fish -c 'fish_prompt | grep -c "❯"' 
        ) = 1
    end
end

if test $USER = 'nemo'
    test "installation methods: with fisher"
        (
            fisher add rafaelrinaldi/pure >/dev/null
            fish -c 'fish_prompt | grep -c "❯"' 
        ) = 1
    end
end

if test $USER = 'nemo'
    test "installation methods: with OMF (Oh-My-Fish!)"
        (
            curl -L https://get.oh-my.fish > install
            fish install --noninteractive >/dev/null
            fish -c "omf install pure; fish_prompt" | grep -c '❯' 
        ) = 1
    end
end

if test $USER = 'nemo'
    test "installation methods: with Fundle"
        (
            mkdir -p $HOME/.config/fish/functions
            curl https://git.io/fundle --output $HOME/.config/fish/functions/fundle.fish --location --silent >/dev/null
            fundle plugin rafaelrinaldi/pure >/dev/null
            fundle install >/dev/null
            fish -c 'fish_prompt | grep -c "❯"' 
        ) = 1
    end
end
