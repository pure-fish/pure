function _pure_print_prompt_rows \
    --description "Manage default vs. compact prompt"

    # print current path, git branch/status, command duration
    if set --query pure_enable_single_line_prompt; and test $pure_enable_single_line_prompt = true
        echo -e -n (_pure_prompt_first_line)
    else
        echo -e (_pure_prompt_first_line)
    end
end
