if test $USER = 'nemo'
    test "install manually"
        (
            curl git.io/pure-fish --output /tmp/pure_installer.fish --location --silent > /dev/null
            source /tmp/pure_installer.fish
            and install_pure > /dev/null
            fish_prompt | grep -c '❯' 
        ) = 1
    end
end

if test $USER = 'nemo'
    test "install with fisher"
        (
            fisher add rafaelrinaldi/pure >/dev/null
            fish_prompt | grep -c '❯' 
        ) = 1
    end
end

if test $USER = 'nemo'
    test "install with OMF (Oh-My-Fish!)"
        (
            curl -L https://get.oh-my.fish > install
            fish install --noninteractive > /dev/null
            fish -c "omf install pure; fish_prompt" | grep -c '❯' 
        ) = 1
    end
end

# if test $USER = 'nemo'
#     test "install with Fundle"
#         (
#             mkdir -p ~/.config/fish/functions
#             wget https://git.io/fundle -O ~/.config/fish/functions/fundle.fish
#             fundle plugin rafaelrinaldi/pure
#             fundle install
#             fish_prompt | grep -c '❯' 
#         ) = 1
#     end
# end
