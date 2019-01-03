source $DIRNAME/../functions/_pure_prompt_current_folder.fish

set --local empty ''
set --local fail 1

test "fails _pure_prompt_current_folder if no argument given"
    (
        _pure_prompt_current_folder
    ) $status -eq $fail
end

test "returns _pure_prompt_current_folder"
    (
        set pure_color_current_folder $empty
        set COLUMNS 20
        set current_prompt_width 10

        string length (_pure_prompt_current_folder $current_prompt_width)
    ) = 9
end
