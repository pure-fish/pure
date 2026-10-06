function _pure_prompt_git_truncate \
    --description "Return path from VSC root if feature enabled and in VCS directory"

    if test "$pure_truncate_prompt_current_directory_to_git_root" = true
        and type -q --no-functions git # skip when `git` is not available

        set --local git_root (command git rev-parse --show-toplevel 2>/dev/null)

        if test -n "$git_root"
            set --local git_subpath (command git rev-parse --show-prefix 2>/dev/null)
            echo (string trim --right --chars=/ -- (basename $git_root)/$git_subpath)
            return 0
        end
    end

    return 1
end
