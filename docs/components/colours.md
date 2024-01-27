<!-- markdownlint-disable MD041 -->
!!! tip

    See [`set_color`][fish-set-color] documentation for full possibilities.

!!! info

    The absence of `$` sign is expected in `pure_` named colours.

| Base Color               | Inherited by                                                                                                                                                                                                        | Default   |
| :----------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :-------- |
| **`pure_color_danger`**  | **`pure_color_prompt_on_error`**                                                                                                                                                                                    | `red`     |
| **`pure_color_dark`**    |                                                                                                                                                                                                                     | `black`   |
| **`pure_color_info`**    | **`pure_color_git_unpulled_commits`**<br>**`pure_color_git_unpushed_commits`**                                                                                                                                      | `cyan`    |
| **`pure_color_light`**   | **`pure_color_username_root`**                                                                                                                                                                                      | `white`   |
| **`pure_color_mute`**    | **`pure_color_git_branch`**<br>**`pure_color_git_dirty`**<br>**`pure_color_git_stash`**<br>**`pure_color_hostname`**<br>**`pure_color_at_sign`**<br>**`pure_color_username_normal`**<br>**`pure_color_virtualenv`** | `brblack` |
| **`pure_color_normal`**  | **`pure_color_jobs`**                                                                                                                                                                                               | `normal`  |
| **`pure_color_primary`** | **`pure_color_current_directory`**                                                                                                                                                                                  | `blue`    |
| **`pure_color_success`** | **`pure_color_prompt_on_success`**                                                                                                                                                                                  | `magenta` |
| **`pure_color_warning`** | **`pure_color_command_duration`**                                                                                                                                                                                   | `yellow`  |

<!-- markdownlint-disable MD053 -->
[fish-set-color]: https://fishshell.com/docs/current/cmds/set_color.html
