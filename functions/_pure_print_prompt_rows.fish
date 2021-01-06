function _pure_print_prompt_rows \
    --description "Manage default vs. compact prompt"

    # print current path, git branch/status, command duration
    if _pure_is_single_line_prompt
        echo -e -n (_pure_prompt_first_line)
    else
        echo -e (_pure_prompt_first_line)
    end
end
