function __parse_current_folder
  pwd | sed "s/^\/Users\/$USER/~/"
end

function __parse_git_branch
  git symbolic-ref HEAD | sed -e "s/^refs\/heads\///"
end

function fish_prompt
  # Symbols

  set -l PURE_SYMBOL_PROMPT "❯"
  set -l PURE_SYMBOL_GIT_DOWN_ARROW "⇣"
  set -l PURE_SYMBOL_GIT_UP_ARROW "⇡"
  set -l PURE_SYMBOL_GIT_DIRTY "*"

  # Colors

  set -l color_red (set_color red)
  set -l color_green (set_color green)
  set -l color_blue (set_color blue)
  set -l color_yellow (set_color yellow)
  set -l color_gray (set_color white)
  set -l color_normal (set_color normal)

  # Template
  set -l folder (__parse_current_folder)
  set -l git_branch_name ""
  set -l git_dirty ""
  set -l git_arrows ""

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

      # Resolve Git arrows by treating `git_status`
      set -l git_arrow_left (command echo $git_status | cut -c 1 ^/dev/null)
      set -l git_arrow_right (command echo $git_status | cut -c 3 ^/dev/null)

    # If arrow is not "0", it means it's dirty
      if test $git_arrow_left -ne "0"
        set git_arrows $PURE_SYMBOL_GIT_UP_ARROW
      end

      if test $git_arrow_right -ne "0"
        set git_arrows $git_arrows $PURE_SYMBOL_GIT_DOWN_ARROW
      end
    end
  end

  echo "$folder $git_branch_name$git_dirty $git_arrows"
  echo -n -s "$PURE_SYMBOL_PROMPT "
end
