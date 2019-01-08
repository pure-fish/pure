source $DIRNAME/../functions/_pure_set_default.fish
source $DIRNAME/../conf.d/pure.fish

set --local empty ''

test "configure: pure_version" 
    (
        echo $pure_version
    ) != $empty
end

test "configure: _pure_fresh_session" 
    (
        echo $_pure_fresh_session
    ) = true
end

test "configure: VIRTUAL_ENV_DISABLE_PROMPT" 
    (
        echo $VIRTUAL_ENV_DISABLE_PROMPT
    ) = 1
end

test "configure: pure_symbol_prompt" 
    (
        echo $pure_symbol_prompt
    ) = "❯"
end

test "configure: pure_symbol_git_arrow_down" 
    (
        echo $pure_symbol_git_arrow_down
    ) = "⇣"
end

test "configure: pure_symbol_git_arrow_up" 
    (
        echo $pure_symbol_git_arrow_up
    ) = "⇡"
end

test "configure: pure_symbol_git_dirty" 
    (
        echo $pure_symbol_git_dirty
    ) = "*"
end

test "configure: pure_symbol_horizontal_bar" 
    (
        echo $pure_symbol_horizontal_bar
    ) = "—"
end

test "configure: pure_color_blue" 
    (
        echo $pure_color_blue
    ) = (set_color blue)
end

test "configure: pure_color_cyan" 
    (
        echo $pure_color_cyan
    ) = (set_color cyan)
end

test "configure: pure_color_gray" 
    (
        echo $pure_color_gray
    ) = (set_color brblack)
end

test "configure: pure_color_magenta" 
    (
        echo $pure_color_magenta
    ) = (set_color magenta)
end

test "configure: pure_color_normal" 
    (
        echo $pure_color_normal
    ) = (set_color normal)
end

test "configure: pure_color_red" 
    (
        echo $pure_color_red
    ) = (set_color red)
end

test "configure: pure_color_white" 
    (
        echo $pure_color_white
    ) = (set_color white)
end

test "configure: pure_color_yellow" 
    (
        echo $pure_color_yellow
    ) = (set_color yellow)
end

test "configure: pure_color_command_duration" 
    (
        echo $pure_color_command_duration
    ) = (set_color yellow)
end

test "configure: pure_color_current_folder" 
    (
        echo $pure_color_current_folder
    ) = (set_color blue)
end

test "configure: pure_color_git_arrows" 
    (
        echo $pure_color_git_arrows
    ) = (set_color cyan)
end

test "configure: pure_color_git_branch" 
    (
        echo $pure_color_git_branch
    ) = (set_color brblack)
end

test "configure: pure_color_git_dirty" 
    (
        echo $pure_color_git_dirty
    ) = (set_color brblack)
end

test "configure: pure_color_ssh_host" 
    (
        echo $pure_color_ssh_host
    ) = (set_color brblack)
end

test "configure: pure_color_ssh_separator" 
    (
        echo $pure_color_ssh_separator
    ) = (set_color brblack)
end

test "configure: pure_color_ssh_user_normal" 
    (
        echo $pure_color_ssh_user_normal
    ) = (set_color brblack)
end

test "configure: pure_color_ssh_user_root" 
    (
        echo $pure_color_ssh_user_root
    ) = (set_color white)
end

test "configure: pure_color_symbol_error" 
    (
        echo $pure_color_symbol_error
    ) = (set_color red)
end

test "configure: pure_color_symbol_success" 
    (
        echo $pure_color_symbol_success
    ) = (set_color magenta)
end

test "configure: pure_color_virtualenv" 
    (
        echo $pure_color_virtualenv
    ) = (set_color brblack)
end

test "configure: pure_prompt_begin_with_current_directory" 
    (
        echo $pure_prompt_begin_with_current_directory
    ) = true
end

test "configure: pure_separate_prompt_on_error" 
    (
        echo $pure_separate_prompt_on_error
    ) = false
end

test "configure: pure_command_max_exec_time" 
    (
        echo $pure_command_max_exec_time
    ) = 5
end

test "configure: pure_right_prompt" 
    (
        echo $pure_right_prompt
    ) = ""
end

test "configure: pure_color_right_prompt" 
    (
        echo $pure_color_right_prompt
    ) = (set_color normal)
end
