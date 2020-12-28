function _pure_print_prompt_rows \
    --description "Manage default vs. compact prompt"

    # print current path, git branch/status, command duration
    if set --query pure_enable_compact_prompt; and test $pure_enable_compact_prompt = true
        echo -e -n (_pure_prompt_first_line)
    else
        echo -e (_pure_prompt_first_line)
    end
end
