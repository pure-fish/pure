function __parse_current_folder -d "Replace '$HOME' with '~'"
  pwd | sed "s|$HOME|~|"
end
