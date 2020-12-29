source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_place_iterm2_prompt_mark.fish
@mesg (print_filename $current_filename)


@test "_pure_place_iterm2_prompt_mark: no iterm2 prompt mark when NOT in iTerm" (
    echo (_pure_place_iterm2_prompt_mark)
) = $EMPTY

@test "_pure_place_iterm2_prompt_mark: shows iterm2 prompt mark in iTerm" (
    function iterm2_prompt_mark; echo 'iterm2-mark'; end

    echo (_pure_place_iterm2_prompt_mark)
) = 'iterm2-mark'
