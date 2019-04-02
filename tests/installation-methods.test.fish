function rm_pure_files
    for file in $HOME/.config/fish/functions/_pure*.fish
        rm --recursive --force "$file"
    end
    for file in $HOME/.config/fish/conf.d/*pure*
        rm --recursive --force "$file"
    end
    rm --recursive --force $HOME/.config/fish/functions/theme-pure
end

function rm_fish_prompt_files
    for file in $HOME/.config/fish/functions/fish_*.fish
        rm --recursive --force "$file"
    end
end

function setup
    if test $USER = 'nemo'
        rm_pure_files
        rm_fish_prompt_files
        echo '' > $HOME/.config/fish/config.fish
    end
end

if test $USER = 'nemo'
    @test "installation methods: manually (with unpublished installer)" (
        source tools/installer.fish

        and install_pure >/dev/null
        source $PURE_INSTALL_DIR/conf.d/*

        fish -c 'fish_prompt | grep -c "❯"' 
    ) = 1
end

if test $USER = 'nemo'
    @test "installation methods: manually (with published installer)" (
        curl git.io/pure-fish --output /tmp/installer.fish --location --silent
        and source /tmp/installer.fish
        and install_pure

        fish -c 'fish_prompt | grep -c "❯"' 
    ) = 1
end

if test $USER = 'nemo'
    @test "installation methods: with fisher" (
        fisher add rafaelrinaldi/pure >/dev/null

        fish -c 'fish_prompt | grep -c "❯"' 
    ) = 1
end

if test $USER = 'nemo'
    @test "installation methods: with OMF (Oh-My-Fish!)" (
        rm --recursive --force $HOME/.local/share/omf $HOME/.config/omf/

        curl -L https://get.oh-my.fish > install
        and fish install --noninteractive >/dev/null

        set --global OMF_PURE_PATH $HOME/.local/share/omf/themes/pure
        fish -c "omf install pure; \
                ln -sf $OMF_PURE_PATH/fish_*.fish $HOME/.config/fish/functions/; \
                ln -sf $OMF_PURE_PATH/functions/*.fish $HOME/.config/fish/functions/; \
                ln -sf $OMF_PURE_PATH/conf.d/* $HOME/.config/fish/conf.d/" > /dev/null
        fish -c "fish_prompt" | grep -c '❯' 
    ) = 1
end

# if test $USER = 'nemo'
#     @test "installation methods: with Fundle" (
#         rm --recursive --force $HOME/.config/fish/fundle/
#         mkdir -p $HOME/.config/fish/functions
#         curl https://git.io/fundle --output $HOME/.config/fish/functions/fundle.fish --location --silent >/dev/null

#         fundle plugin rafaelrinaldi/pure >/dev/null
#         fundle install >/dev/null
#         cp $HOME/.config/fish/fundle/rafaelrinaldi/pure/{,functions/}fish_prompt.fish

#         fish -c 'fish_prompt | grep -c "❯"' 
#     ) = 1
# end
