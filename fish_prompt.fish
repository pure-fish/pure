#!/usr/bin/env fish
# vim: set ft=sh:

# Pure
# by Rafael Rinaldi
# https://github.com/rafaelrinaldi/pure
# MIT License

# Whether or not is a fresh session
set -g fresh_session 1

# Symbols

set -g symbol_prompt "❯"
set -g symbol_git_down_arrow "⇣"
set -g symbol_git_up_arrow "⇡"
set -g symbol_git_dirty "*"
set -g symbol_horizontal_bar "—"

# Colors

set -g color_red (set_color red)
set -g color_green (set_color green)
set -g color_blue (set_color blue)
set -g color_yellow (set_color yellow)
set -g color_cyan (set_color cyan)
set -g color_gray (set_color 93A1A1)
set -g color_normal (set_color normal)

function fish_prompt
  # Save previous exit code
  set -l exit_code $status

  # Set default color symbol to green meaning it's all good!
  set -l color_symbol $color_green

  # Template

  set -l current_folder (__parse_current_folder)
  set -l git_branch_name ""
  set -l git_dirty ""
  set -l git_arrows ""
  set -l command_duration ""
  set -l prompt ""

  # Do not add a line break to a brand new session
  if test $fresh_session -eq 0
    set prompt $prompt "\n"
  end

  # Format current folder on prompt output
  set prompt $prompt "$color_blue$current_folder$color_normal "

  # Handle previous failed command
  if test $exit_code -ne 0
    # Symbol color is red when previous command fails
    set color_symbol $color_red

    # Prompt failed command execution duration
    set command_duration (__format_time $CMD_DURATION)

    set prompt $prompt "$color_yellow$command_duration$color_normal"
  end

  # Exit with code 1 if git is not available
  if not command -s git >/dev/null
    return 1
  end

  # Check if is on a Git repository
  set -l is_git_repository (command git rev-parse --is-inside-work-tree ^/dev/null)

  if test -n "$is_git_repository"
    set git_branch_name (__parse_git_branch)

    # Check if there are files to commit
    set -l is_git_dirty (command git status --porcelain --ignore-submodules ^/dev/null)

    if test -n "$is_git_dirty"
      set git_dirty $symbol_git_dirty
    end

    # Check if there is an upstream configured
    set -l has_upstream (command git rev-parse --abbrev-ref @'{u}' ^/dev/null)

    if test -n "$has_upstream"
      set -l git_status (command git rev-list --left-right --count HEAD...@'{u}' | sed "s/[[:blank:]]/ /" ^/dev/null)

      # Resolve Git arrows by treating `git_status` as an array
      set -l git_arrow_left (command echo $git_status | cut -c 1 ^/dev/null)
      set -l git_arrow_right (command echo $git_status | cut -c 3 ^/dev/null)

    # If arrow is not "0", it means it's dirty
      if test $git_arrow_left -ne "0"
        set git_arrows $symbol_git_up_arrow
      end

      if test $git_arrow_right -ne "0"
        set git_arrows $git_arrows$symbol_git_down_arrow
      end
    end

    # Format Git prompt output
    set prompt $prompt "$color_gray$git_branch_name$git_dirty$color_normal\t$color_cyan$git_arrows$color_normal"
  end

  set prompt $prompt "\n$color_symbol$symbol_prompt$color_normal "

  echo -e -s $prompt

  set fresh_session 0
end