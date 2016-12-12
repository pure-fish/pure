function __parse_git_branch -d "Parse current Git branch name"
  command git symbolic-ref --short HEAD ^/dev/null;
    or string split '\n' (command git show-ref --head -s --abbrev)[1]
end
