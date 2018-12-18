# Removes right prompt
function fish_right_prompt
    set_color $pure_right_prompt_color

    echo "$pureright_prompt"

    set_color normal
end
