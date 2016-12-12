function __parse_current_folder -d "Replace '$HOME' with '~'"
  string replace $HOME '~' $PWD
end
