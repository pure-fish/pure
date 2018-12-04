function __pure_new_line
    set --local new_line
    # Do not add a line break to a brand new session
    if test $__pure_fresh_session -eq 0
        set new_line "\n"
    end
    # Clear existen line content
    set --local new_line "$new_line\r\033[K"

    echo $new_line
end
