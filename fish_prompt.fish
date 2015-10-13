function __parse_current_folder -d "Replace '/Users/$USER' by '~'"
  pwd | sed "s/^\/Users\/$USER/~/"
end

function __parse_git_branch -d "Parse current Git branch name"
  git symbolic-ref HEAD | sed -e "s/^refs\/heads\///"
end

function __format_time -d "Format milliseconds to a human readable format"
  set -l millseconds $argv[1]
  set -l seconds (math "$millseconds / 1000 % 60")
  set -l minutes (math "$millseconds / 60000 % 60")
  set -l hours (math "$millseconds / 3600000 % 24")
  set -l days (math "$millseconds / 86400000")
  set -l time ""

  if test $days -gt 0
    set time (command printf "$time%sd " $days)
  end
  
  if test $hours -gt 0
    set time (command printf "$time%sh " $hours)
  end
  
  if test $minutes -gt 0
    set time (command printf "$time%sm " $minutes)
  end

  set time (command printf "$time%ss" $seconds)

  echo -e -n $time
end

function fish_prompt
  set -l exit_code $status

  # Symbols

  set -l symbol_prompt "❯"
  set -l symbol_git_down_arrow "⇣"
  set -l symbol_git_up_arrow "⇡"
  set -l symbol_git_dirty "*"

  # Colors

  set -l color_red (set_color red)
  set -l color_green (set_color green)
  set -l color_blue (set_color blue)
  set -l color_yellow (set_color yellow)
  set -l color_cyan (set_color cyan)
  set -l color_gray (set_color 93A1A1)
  set -l color_normal (set_color normal)
  set -l color_symbol $color_green

  # Template

  set -l current_folder (__parse_current_folder)
  set -l git_branch_name ""
  set -l git_dirty ""
  set -l git_arrows ""
  set -l command_duration ""

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
      set git_dirty $PURE_SYMBOL_GIT_DIRTY
    end

    # Check if there is an upstream configured
    set -l has_upstream (command git rev-parse --abbrev-ref @'{u}' ^/dev/null)

    if test -n "$has_upstream"
      set -l git_status (command git rev-list --left-right --count HEAD...@'{u}' | sed 's/[[:blank:]]/ /' ^/dev/null)

      # Resolve Git arrows by treating `git_status` as an array
      set -l git_arrow_left (command echo $git_status | cut -c 1 ^/dev/null)
      set -l git_arrow_right (command echo $git_status | cut -c 3 ^/dev/null)

    # If arrow is not "0", it means it's dirty
      if test $git_arrow_left -ne "0"
        set git_arrows $symbol_git_up_arrow
      end

      if test $git_arrow_right -ne "0"
        set git_arrows $git_arrows $symbol_git_down_arrow
      end
    end
  end

  if test $exit_code -ne 0
    # Symbol color is red when previous command fails
    set color_symbol $color_red

    # Prompt failed command execution duration
    set command_duration (__format_time $CMD_DURATION)
  end

  echo -e "\n$color_blue$current_folder$color_normal $command_duration$color_gray$git_branch_name$git_dirty$color_normal\t$color_cyan$git_arrows$color_normal"
  echo -n -s "$color_symbol$symbol_prompt$color_normal "
end

# Set title to current folder and shell name
function fish_title
  echo (__parse_current_folder) – $_
end

# Removes right prompt
function fish_right_prompt
end
