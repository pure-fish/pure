# vim: set ft=sh:

# Pure
# by Rafael Rinaldi
# https://github.com/rafaelrinaldi/pure
# MIT License

# Whether or not is a fresh session
set -g __pure_fresh_session 1

# Symbols

__pure_set_default pure_symbol_prompt "❯"
__pure_set_default pure_symbol_git_down_arrow "⇣"
__pure_set_default pure_symbol_git_up_arrow "⇡"
__pure_set_default pure_symbol_git_dirty "*"
__pure_set_default pure_symbol_horizontal_bar "—"

# Colors

__pure_set_default pure_color_red (set_color red)
__pure_set_default pure_color_green (set_color green)
__pure_set_default pure_color_blue (set_color blue)
__pure_set_default pure_color_yellow (set_color yellow)
__pure_set_default pure_color_cyan (set_color cyan)
__pure_set_default pure_color_gray (set_color 93A1A1)
__pure_set_default pure_color_normal (set_color normal)

function fish_prompt
  # Save previous exit code
  set -l exit_code $status

  # Set default color symbol to green meaning it's all good!
  set -l color_symbol $pure_color_green

  # Template

  set -l current_folder (__parse_current_folder)
  set -l git_branch_name ""
  set -l git_dirty ""
  set -l git_arrows ""
  set -l command_duration ""
  set -l prompt ""

  # Do not add a line break to a brand new session
  if test $__pure_fresh_session -eq 0
    set prompt $prompt "\n"
  end

  # Format current folder on prompt output
  set prompt $prompt "$pure_color_blue$current_folder$pure_color_normal "

  # Handle previous failed command
  if test $exit_code -ne 0
    # Symbol color is red when previous command fails
    set color_symbol $pure_color_red

    # Prompt failed command execution duration
    set command_duration (__format_time $CMD_DURATION)

    set prompt $prompt "$pure_color_yellow$command_duration$pure_color_normal"
  end

  # Exit with code 1 if git is not available
  if not which git >/dev/null
    return 1
  end

  # Check if is on a Git repository
  set -l is_git_repository (command git rev-parse --is-inside-work-tree ^/dev/null)

  if test -n "$is_git_repository"
    set git_branch_name (__parse_git_branch)

    # Check if there are files to commit
    set -l is_git_dirty (command git status --porcelain --ignore-submodules ^/dev/null)

    if test -n "$is_git_dirty"
      set git_dirty $pure_symbol_git_dirty
    end

    # Check if there is an upstream configured
    command git rev-parse --abbrev-ref '@{upstream}' >/dev/null ^&1; and set -l has_upstream
    if set -q has_upstream
      set -l git_status (command git rev-list --left-right --count 'HEAD...@{upstream}' | sed "s/[[:blank:]]/ /" ^/dev/null)

      # Resolve Git arrows by treating `git_status` as an array
      set -l git_arrow_left (command echo $git_status | cut -c 1 ^/dev/null)
      set -l git_arrow_right (command echo $git_status | cut -c 3 ^/dev/null)

    # If arrow is not "0", it means it's dirty
      if test $git_arrow_left != 0
        set git_arrows $pure_symbol_git_up_arrow
      end

      if test $git_arrow_right != 0
        set git_arrows $git_arrows$pure_symbol_git_down_arrow
      end
    end

    # Format Git prompt output
    set prompt $prompt "$pure_color_gray$git_branch_name$git_dirty$pure_color_normal\t$pure_color_cyan$git_arrows$pure_color_normal"
  end

  set prompt $prompt "\n$color_symbol$pure_symbol_prompt$pure_color_normal "

  echo -e -s $prompt

  set __pure_fresh_session 0
end
