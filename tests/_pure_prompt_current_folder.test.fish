source $DIRNAME/../functions/_pure_prompt_current_folder.fish

set --local empty ''
set --local fail 1

test "_pure_prompt_current_folder: fails if no argument given"
    (
        _pure_prompt_current_folder
    ) $status -eq $fail
end

test "_pure_prompt_current_folder: returns current folder"
    (
        set pure_color_current_folder $empty
        set COLUMNS 20
        set current_prompt_width 10

        string length (_pure_prompt_current_folder $current_prompt_width)
    ) = 9
end
