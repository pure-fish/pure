#!/usr/bin/env fish

function __parse_current_folder -d "Replace '/Users/$USER' by '~'"
  pwd | sed "s/^\/Users\/$USER/~/"
end