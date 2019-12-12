function _pure_parse_git_branch --description "Parse current Git branch name"
    command git symbolic-ref --short HEAD 2>/dev/null;
        or command git name-rev --name-only HEAD 2>/dev/null
end
