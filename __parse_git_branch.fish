#!/usr/bin/env fish

function __parse_git_branch -d "Parse current Git branch name"
  git symbolic-ref HEAD | sed -e "s/^refs\/heads\///"
end