function _pure_parse_git_branch -d "Parse current Git branch name"
    command git symbolic-ref --short HEAD 2>/dev/null;
        or echo (command git show-ref --head -s --abbrev HEAD)[1]
end
