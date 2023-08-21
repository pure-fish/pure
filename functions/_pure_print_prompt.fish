function _pure_print_prompt \
    --description 'Concatenate parts single prompt string'
    set --local prompt

    for prompt_part in $argv
        if test (_pure_string_width $prompt_part) -gt 0
            set --append prompt "$prompt_part"
        end
    end

    echo (string trim -l $prompt)
end
