# Set title to current folder and shell name
function fish_title
  set -l basename (string replace -r '^.*/' '' -- $PWD)
  set -l current_folder (__parse_current_folder)
  set -l command $argv[1]
  set -l prompt "$basename: $command $pure_symbol_horizontal_bar $_"

  if test -z "$command"
    set prompt "$current_folder $pure_symbol_horizontal_bar $_"
  end

  echo $prompt
end
