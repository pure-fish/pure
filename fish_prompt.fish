# Pure
# by Rafael Rinaldi
# https://github.com/rafaelrinaldi/pure
# MIT License

function fish_prompt
  set -l prompt ""

  # Save previous exit code
  set -l exit_code $status

  # Set default color symbol to green meaning it's all good!
  set -l color_symbol $pure_color_green

  # Handle previous failed command
  if test $exit_code -ne 0
    # Symbol color is red when previous command fails
    set color_symbol $pure_color_red
    if test $pure_separate_prompt_on_error -eq 1
      set color_symbol $pure_color_red$pure_symbol_prompt$pure_color_green
    end
  end

  # Show python virtualenv name (if activated)
  if test -n "$VIRTUAL_ENV"
    set prompt $prompt $pure_color_gray(basename "$VIRTUAL_ENV")"$pure_color_normal "
  end

  # vi-mode indicator
  set mode_indicator (fish_default_mode_prompt)

  set prompt $prompt "$mode_indicator$color_symbol$pure_symbol_prompt$pure_color_normal "

  echo -e -s $prompt

  set __pure_fresh_session 0
end
