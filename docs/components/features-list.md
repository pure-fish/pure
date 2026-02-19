<!-- markdownlint-disable MD041 -->

### Check For New Release

| Option                           | Default | Description                                               |
| :------------------------------- | :------ | :-------------------------------------------------------- |
| **`pure_check_for_new_release`** | `false` | `true`: check repo for new release (on every shell start) |

!!! info "Setting up release checking"

    Check the troubleshooting section [Customizing Fish Greeting](#customizing-fish-greeting).

!!! success "🐌 Faster Prompt"

    Checking new release sends an HTTP request that slows down your prompt rendering
    as it waits for remote server response. Set it to `false` to speed up rendering:

    ```fish
    set --universal pure_check_for_new_release false
    ```

=== "Enabled (with update)"

    ![screenshot pure_check_for_new_release=true,with-update](/pure/assets/screenshots/light-pure_check_for_new_release%3Dtrue%2Cwith-update.png#only-light)
    ![screenshot pure_check_for_new_release=true,with-update](/pure/assets/screenshots/mirage-pure_check_for_new_release%3Dtrue%2Cwith-update.png#only-dark)

=== "Enabled (no update)"

    ![screenshot pure_check_for_new_release=true,no-update](/pure/assets/screenshots/light-pure_check_for_new_release%3Dtrue%2Cno-update.png#only-light)
    ![screenshot pure_check_for_new_release=true,no-update](/pure/assets/screenshots/mirage-pure_check_for_new_release%3Dtrue%2Cno-update.png#only-dark)

### Container Detection (Docker)

| Option                                | Default | Description                                                                                                                                                                    |
| :------------------------------------ | :------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`pure_enable_container_detection`** | `true`  | `false`: Do not check _pure_ runs inside a container (e.g. `docker`, `podman`, `LXC`/`LXD`, etc.).<br/>:warning: Detection is a bit [tricky across OSes][container-detection]. |
| **`pure_symbol_container_prefix`**    |         | Prefix when being inside a container ([to customize][to-set])                                                                                                                  |

[container-detection]: <https://stackoverflow.com/q/23513045/802365>

=== "Enabled (inside a container)"

    ![screenshot pure_enable_container_detection=true,inside](/pure/assets/screenshots/light-pure_enable_container_detection%3Dtrue%2Cinside.png#only-light)
    ![screenshot pure_enable_container_detection=true,inside](/pure/assets/screenshots/mirage-pure_enable_container_detection%3Dtrue%2Cinside.png#only-dark)

=== "Enabled (outside a container)"

    ![screenshot pure_enable_container_detection=true,outside](/pure/assets/screenshots/light-pure_enable_container_detection%3Dtrue%2Coutside.png#only-light)
    ![screenshot pure_enable_container_detection=true,outside](/pure/assets/screenshots/mirage-pure_enable_container_detection%3Dtrue%2Coutside.png#only-dark)

### Current Working Directory

| Option                                             | Default | Description                                                                                                          |
| :------------------------------------------------- | :------ | :------------------------------------------------------------------------------------------------------------------- |
| **`pure_begin_prompt_with_current_directory`**     | `true`  | `true`: _`pwd` `git`, `SSH`, duration_.<br/>`false`: _`SSH` `pwd` `git`, duration_.                                  |
| **`pure_shorten_prompt_current_directory_length`** | `0`     | Shorten every prompt path component but the last to X characters (0 do not shorten)                                  |
| **`pure_truncate_prompt_current_directory_keeps`** | `0`     | Truncate working directory path in prompt, but keeps the last to `n` components (`0` full path in current directory) |

=== "Enabled (pwd first)"

    ![screenshot pure_begin_prompt_with_current_directory=true](/pure/assets/screenshots/light-pure_begin_prompt_with_current_directory%3Dtrue.png#only-light)
    ![screenshot pure_begin_prompt_with_current_directory=true](/pure/assets/screenshots/mirage-pure_begin_prompt_with_current_directory%3Dtrue.png#only-dark)

=== "Disabled (SSH first)"

    ![screenshot pure_begin_prompt_with_current_directory=false](/pure/assets/screenshots/light-pure_begin_prompt_with_current_directory%3Dfalse.png#only-light)
    ![screenshot pure_begin_prompt_with_current_directory=false](/pure/assets/screenshots/mirage-pure_begin_prompt_with_current_directory%3Dfalse.png#only-dark)

### Git

| Option                                 | Default | Description                                          |
| :------------------------------------- | :------ | :--------------------------------------------------- |
| **`pure_enable_git`**                  | `true`  | Show info about Git repository.                      |
| **`pure_symbol_git_dirty`**            | `*`     | Repository is Dirty (uncommitted/untracked changes). |
| **`pure_symbol_git_stash`**            | `≡`     | Repository git stash status.                         |
| **`pure_symbol_git_unpulled_commits`** | `⇣`     | Branch is behind upstream (commits to pull).         |
| **`pure_symbol_git_unpushed_commits`** | `⇡`     | Branch is ahead upstream (commits to push).          |
| **`pure_show_numbered_git_indicator`** | `false` | Show number of git stash and commits behind/ahead    |

> :information_source: Need [safer `git` symbols](https://github.com/sindresorhus/pure/wiki/Customizations,-hacks-and-tweaks#safer-symbols)?

=== "Enabled (with `git`)"

    ![screenshot pure_enable_git=true](/pure/assets/screenshots/light-pure_enable_git%3Dtrue.png#only-light)
    ![screenshot pure_enable_git=true](/pure/assets/screenshots/mirage-pure_enable_git%3Dtrue.png#only-dark)

=== "Disabled (without `git` info)"

    ![screenshot pure_enable_git=false](/pure/assets/screenshots/light-pure_enable_git%3Dfalse.png#only-light)
    ![screenshot pure_enable_git=false](/pure/assets/screenshots/mirage-pure_enable_git%3Dfalse.png#only-dark)

### Jobs

| Option               | Default | Description                 |
| :------------------- | :------ | :-------------------------- |
| **`pure_show_jobs`** | `false` | Show Number of running jobs |

=== "Enabled (with running jobs)"

    ![screenshot pure_show_jobs=true](/pure/assets/screenshots/light-pure_show_jobs%3Dtrue.png#only-light)
    ![screenshot pure_show_jobs=true](/pure/assets/screenshots/mirage-pure_show_jobs%3Dtrue.png#only-dark)

=== "Disabled (without jobs info)"

    ![screenshot pure_show_jobs=false](/pure/assets/screenshots/light-pure_show_jobs%3Dfalse.png#only-light)
    ![screenshot pure_show_jobs=false](/pure/assets/screenshots/mirage-pure_show_jobs%3Dfalse.png#only-dark)

### Kubernetes

| Option                       | Default | Description                                       |
| :--------------------------- | :------ | :------------------------------------------------ |
| **`pure_symbol_k8s_prefix`** | `☸`     | Prefix when being connected to Kubernetes/K8s     |
| **`pure_enable_k8s`**        | `false` | `true`: shows `kubernetes` context and namespace. |

=== "Enabled (with `k8s` context and namespace)"

    ![screenshot pure_enable_k8s=true](/pure/assets/screenshots/light-pure_enable_k8s%3Dtrue.png#only-light)
    ![screenshot pure_enable_k8s=true](/pure/assets/screenshots/mirage-pure_enable_k8s%3Dtrue.png#only-dark)

=== "Disabled (without `k8s` info)"

    ![screenshot pure_enable_k8s=false](/pure/assets/screenshots/light-pure_enable_k8s%3Dfalse.png#only-light)
    ![screenshot pure_enable_k8s=false](/pure/assets/screenshots/mirage-pure_enable_k8s%3Dfalse.png#only-dark)

### NixOS

> Indicate if nix develop shell is activated in their prompt.

| Option                               | Default           | Description                                                                          |
| :----------------------------------- | :---------------- | :----------------------------------------------------------------------------------- |
| **`pure_enable_nixdevshell`**        | `false`           | Indicate if a [`nix develop` shell][nix-dev] is activated (based on `IN_NIX_SHELL`). |
| **`pure_symbol_nixdevshell_prefix`** | `❄️`               | otherwise [nerdfonts](https://www.nerdfonts.com/): '󱄅' or ''                        |
| **`pure_color_nixdevshell_prefix`**  | `pure_color_info` | prefix color                                                                         |
| **`pure_color_nixdevshell_symbol`**  | `pure_color_mute` | symbol color                                                                         |

[nix-dev]: https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-develop.html

=== "Enabled (inside nix develop shell)"

    ![screenshot pure_enable_nixdevshell=true](/pure/assets/screenshots/light-pure_enable_nixdevshell%3Dtrue.png#only-light)
    ![screenshot pure_enable_nixdevshell=true](/pure/assets/screenshots/mirage-pure_enable_nixdevshell%3Dtrue.png#only-dark)

=== "Disabled (without nix info)"

    ![screenshot pure_enable_nixdevshell=false](/pure/assets/screenshots/light-pure_enable_nixdevshell%3Dfalse.png#only-light)
    ![screenshot pure_enable_nixdevshell=false](/pure/assets/screenshots/mirage-pure_enable_nixdevshell%3Dfalse.png#only-dark)

### Prompt Symbol

| Option                   | Default | Description    |
| :----------------------- | :------ | :------------- |
| **`pure_symbol_prompt`** | `❯`     | Control the prompt symbol. |

### Previous command status

> Previous command exit status change the prompt symbol color.

 <!-- test pure_symbol_prompt after a successful command and a failed one -->
=== "On Successful command"

    ![screenshot pure_symbol_prompt=success](/pure/assets/screenshots/light-pure_symbol_prompt%3Dsuccess.png#only-light)
    ![screenshot pure_symbol_prompt=success](/pure/assets/screenshots/mirage-pure_symbol_prompt%3Dsuccess.png#only-dark)

=== "On Failed command"

    ![screenshot pure_symbol_prompt=error](/pure/assets/screenshots/light-pure_symbol_prompt%3Derror.png#only-light)
    ![screenshot pure_symbol_prompt=error](/pure/assets/screenshots/mirage-pure_symbol_prompt%3Derror.png#only-dark)

### Python Virtualenv

| Option                              | Default | Description                                                                  |
| :---------------------------------- | :------ | :--------------------------------------------------------------------------- |
| **`pure_enable_virtualenv`**        | `true`  | Show virtual env name (based on `VIRTUAL_ENV_PROMPT`, `VIRTUAL_ENV` or `CONDA_DEFAULT_ENV`). |
| **`pure_symbol_virtualenv_prefix`** |         | Prefix when a Python virtual env is activated (default: [undefined][to-set]) |

=== "Enabled (with virtualenv)"

    ![screenshot pure_enable_virtualenv=true](/pure/assets/screenshots/light-pure_enable_virtualenv%3Dtrue.png#only-light)
    ![screenshot pure_enable_virtualenv=true](/pure/assets/screenshots/mirage-pure_enable_virtualenv%3Dtrue.png#only-dark)

=== "Disabled (without virtualenv)"

    ![screenshot pure_enable_virtualenv=false](/pure/assets/screenshots/light-pure_enable_virtualenv%3Dfalse.png#only-light)
    ![screenshot pure_enable_virtualenv=false](/pure/assets/screenshots/mirage-pure_enable_virtualenv%3Dfalse.png#only-dark)

### AWS Profile

| Option                               | Default | Description                                                           |
| :----------------------------------- | :------ | :-------------------------------------------------------------------- |
| **`pure_enable_aws_profile`**        | `true`  | Show AWS profile name (based on `AWS_VAULT` or `AWS_PROFILE`).        |
| **`pure_symbol_aws_profile_prefix`** |         | Prefix when a AWS profile is activated (default: [undefined][to-set]) |

=== "Enabled (with AWS profile)"

    ![screenshot pure_enable_aws_profile=true](/pure/assets/screenshots/light-pure_enable_aws_profile%3Dtrue.png#only-light)
    ![screenshot pure_enable_aws_profile=true](/pure/assets/screenshots/mirage-pure_enable_aws_profile%3Dtrue.png#only-dark)

=== "Disabled (without AWS profile)"

    ![screenshot pure_enable_aws_profile=false](/pure/assets/screenshots/light-pure_enable_aws_profile%3Dfalse.png#only-light)
    ![screenshot pure_enable_aws_profile=false](/pure/assets/screenshots/mirage-pure_enable_aws_profile%3Dfalse.png#only-dark)

### Separate Error Symbol

| Option                              | Default | Description                                                         |
| :---------------------------------- | :------ | :------------------------------------------------------------------ |
| **`pure_separate_prompt_on_error`** | `false` | Show last command [exit code as a second prompt symbol][exit-code]. |

[exit-code]: https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character "See pure-zsh wiki"

=== "Enabled (separate error symbol)"

    ![screenshot pure_separate_prompt_on_error=true](/pure/assets/screenshots/light-pure_separate_prompt_on_error%3Dtrue.png#only-light)
    ![screenshot pure_separate_prompt_on_error=true](/pure/assets/screenshots/mirage-pure_separate_prompt_on_error%3Dtrue.png#only-dark)

=== "Disabled"

    ![screenshot pure_separate_prompt_on_error=false](/pure/assets/screenshots/light-pure_separate_prompt_on_error%3Dfalse.png#only-light)
    ![screenshot pure_separate_prompt_on_error=false](/pure/assets/screenshots/mirage-pure_separate_prompt_on_error%3Dfalse.png#only-dark)

### List Exit Statuses

| Option                                   | Default | Description                                                  |
| :--------------------------------------- | :------ | :----------------------------------------------------------- |
| **`pure_show_exit_status`**              | `false` | `true`: Show list of status codes if the last command failed |
| **`pure_convert_exit_status_to_signal`** | `false` | `true`: Convert statuses 129 and up to their signal names    |
| **`pure_symbol_exit_status_prefix`**     | `|`     | Prefix when the last command failed                          |
| **`pure_symbol_exit_status_separator`**  | `|`     | Separator between statuses in a pipeline                     |

=== "Enabled (list exit statuses)"

    ![screenshot pure_show_exit_status=true](/pure/assets/screenshots/light-pure_show_exit_status%3Dtrue.png#only-light)
    ![screenshot pure_show_exit_status=true](/pure/assets/screenshots/mirage-pure_show_exit_status%3Dtrue.png#only-dark)

=== "Enabled (convert statuses to signals)"

    ![screenshot pure_show_exit_status=true,pure_convert_exit_status_to_signal=true](/pure/assets/screenshots/light-pure_show_exit_status%3Dtrue%2Cpure_convert_exit_status_to_signal%3Dtrue.png#only-light)
    ![screenshot pure_show_exit_status=true,pure_convert_exit_status_to_signal=true](/pure/assets/screenshots/mirage-pure_show_exit_status%3Dtrue%2Cpure_convert_exit_status_to_signal%3Dtrue.png#only-dark)

=== "Disabled"

    ![screenshot pure_show_exit_status=false](/pure/assets/screenshots/light-pure_show_exit_status%3Dfalse.png#only-light)
    ![screenshot pure_show_exit_status=false](/pure/assets/screenshots/mirage-pure_show_exit_status%3Dfalse.png#only-dark)

### Single Line Prompt

| Option                               | Default | Description                             |
| :----------------------------------- | :------ | :-------------------------------------- |
| **`pure_enable_single_line_prompt`** | `false` | `true`: Compact prompt as a single line |

=== "Enabled (prompt on a single line)"

    ![screenshot pure_enable_single_line_prompt=true](/pure/assets/screenshots/light-pure_enable_single_line_prompt%3Dtrue.png#only-light)
    ![screenshot pure_enable_single_line_prompt=true](/pure/assets/screenshots/mirage-pure_enable_single_line_prompt%3Dtrue.png#only-dark)

=== "Disabled (prompt on two lines)"

    ![screenshot pure_enable_single_line_prompt=false](/pure/assets/screenshots/light-pure_enable_single_line_prompt%3Dfalse.png#only-light)
    ![screenshot pure_enable_single_line_prompt=false](/pure/assets/screenshots/mirage-pure_enable_single_line_prompt%3Dfalse.png#only-dark)

### SSH Session

| Option                       | Default | Description                                                               |
| :--------------------------- | :------ | :------------------------------------------------------------------------ |
| **`pure_symbol_ssh_prefix`** |         | Show SSH session prefix, after path, when being connected to an SSH session (default: [undefined][to-set]) |

=== "Connected (show SSH username and host)"

    ![screenshot ssh=connected](/pure/assets/screenshots/light-ssh%3Dconnected.png#only-light)
    ![screenshot ssh=connected](/pure/assets/screenshots/mirage-ssh%3Dconnected.png#only-dark)

=== "Disconnected"

    ![screenshot ssh=disconnected](/pure/assets/screenshots/light-ssh%3Ddisconnected.png#only-light)
    ![screenshot ssh=disconnected](/pure/assets/screenshots/mirage-ssh%3Ddisconnected.png#only-dark)

### Time

| Option                                     | Default | Description                                                         |
| :----------------------------------------- | :------ | :------------------------------------------------------------------ |
| **`pure_show_system_time`**                | `false` | `true`: shows system time before the prompt symbol (as `%H:%M:%S`). |

=== "Show system time (enabled)"

    ![screenshot pure_show_system_time=true](/pure/assets/screenshots/light-pure_show_system_time%3Dtrue.png#only-light)
    ![screenshot pure_show_system_time=true](/pure/assets/screenshots/mirage-pure_show_system_time%3Dtrue.png#only-dark)

=== "Show system time (disabled)"

    ![screenshot pure_show_system_time=false](/pure/assets/screenshots/light-pure_show_system_time%3Dfalse.png#only-light)
    ![screenshot pure_show_system_time=false](/pure/assets/screenshots/mirage-pure_show_system_time%3Dfalse.png#only-dark)

### Command Duration

| Option                                     | Default | Description                                                         |
| :----------------------------------------- | :------ | :------------------------------------------------------------------ |
| **`pure_show_subsecond_command_duration`** | `false` | Show subsecond (ex. 1.5s) in command duration.                      |
| **`pure_threshold_command_duration`**      | `5`     | Show command duration when above this value (seconds).              |

=== "Subsecond duration (disabled)"

    ![screenshot pure_show_subsecond_command_duration=false](/pure/assets/screenshots/light-pure_show_subsecond_command_duration%3Dfalse.png#only-light)
    ![screenshot pure_show_subsecond_command_duration=false](/pure/assets/screenshots/mirage-pure_show_subsecond_command_duration%3Dfalse.png#only-dark)

=== "Subsecond duration (enabled)"

    ![screenshot pure_show_subsecond_command_duration=true](/pure/assets/screenshots/light-pure_show_subsecond_command_duration%3Dtrue.png#only-light)
    ![screenshot pure_show_subsecond_command_duration=true](/pure/assets/screenshots/mirage-pure_show_subsecond_command_duration%3Dtrue.png#only-dark)

### Title

| Option                                                   | Default | Description                                                                                                           |
| :------------------------------------------------------- | :------ | :-------------------------------------------------------------------------------------------------------------------- |
| **`pure_symbol_title_bar_separator`**                    | `-`     | Separator in terminal's windows title.                                                                                |
| **`pure_shorten_window_title_current_directory_length`** | `0`     | Shorten every window title path component but the last to X characters (0 do not shorten)                             |
| **`pure_truncate_window_title_current_directory_keeps`** | `0`     | Truncate working directory path in window title, but keeps the last to `n` components (`0` full path in window title) |

### Transient Prompt

> Simplify previous prompts in scrollback history (Fish 4.1.0+)

| Option                       | Default | Description                                                              |
| :--------------------------- | :------ | :----------------------------------------------------------------------- |
| **`fish_transient_prompt`**  | -       | Fish built-in variable. Set to `1` to enable [transient prompt](https://fishshell.com/docs/4.1/prompt.html#transient-prompt).           |

Shows a simplified prompt (just the prompt symbol) for previous commands, keeping your scrollback clean while maintaining full context on the current prompt.
When enabled, Fish re-runs the prompt with `--final-rendering` before executing a command.

!!! tip "Recommended: Enable Single Line Prompt"

    Transient prompt works best with single line prompt enabled:

    ```fish
    set --universal fish_transient_prompt 1
    set --universal pure_enable_single_line_prompt true
    ```

=== "Enabled (simplified previous prompts, single line)"

    ![screenshot fish_transient_prompt=1,pure_enable_single_line_prompt=true](/pure/assets/screenshots/light-fish_transient_prompt%3D1%2Cpure_enable_single_line_prompt%3Dtrue.png#only-light)
    ![screenshot fish_transient_prompt=1,pure_enable_single_line_prompt=true](/pure/assets/screenshots/mirage-fish_transient_prompt%3D1%2Cpure_enable_single_line_prompt%3Dtrue.png#only-dark)

=== "Enabled (simplified previous prompts, multi-line)"

    ![screenshot fish_transient_prompt=1,pure_enable_single_line_prompt=false](/pure/assets/screenshots/light-fish_transient_prompt%3D1%2Cpure_enable_single_line_prompt%3Dfalse.png#only-light)
    ![screenshot fish_transient_prompt=1,pure_enable_single_line_prompt=false](/pure/assets/screenshots/mirage-fish_transient_prompt%3D1%2Cpure_enable_single_line_prompt%3Dfalse.png#only-dark)

=== "Disabled (full prompts in scrollback)"

    ![screenshot fish_transient_prompt=0,pure_enable_single_line_prompt=true](/pure/assets/screenshots/light-fish_transient_prompt%3D0%2Cpure_enable_single_line_prompt%3Dtrue.png#only-light)
    ![screenshot fish_transient_prompt=0,pure_enable_single_line_prompt=true](/pure/assets/screenshots/mirage-fish_transient_prompt%3D0%2Cpure_enable_single_line_prompt%3Dtrue.png#only-dark)

### VI Mode

| Option                                     | Default | Description                                                                                     |
| :----------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_reverse_prompt_symbol_in_vimode`** | `true`  | `true`: `❮` indicate a non-insert mode.<br/>`false`: indicate vi mode with `[I]`, `[N]`, `[V]`. |
| **`pure_symbol_reverse_prompt`**           | `❮`     | VI non-insert mode symbol.                                                                      |

=== "Reverse symbol (enabled)"

    ![screenshot pure_reverse_prompt_symbol_in_vimode=true](/pure/assets/screenshots/light-pure_reverse_prompt_symbol_in_vimode%3Dtrue.png#only-light)
    ![screenshot pure_reverse_prompt_symbol_in_vimode=true](/pure/assets/screenshots/mirage-pure_reverse_prompt_symbol_in_vimode%3Dtrue.png#only-dark)

=== "Mode indicator (disabled)"

    ![screenshot pure_reverse_prompt_symbol_in_vimode=false](/pure/assets/screenshots/light-pure_reverse_prompt_symbol_in_vimode%3Dfalse.png#only-light)
    ![screenshot pure_reverse_prompt_symbol_in_vimode=false](/pure/assets/screenshots/mirage-pure_reverse_prompt_symbol_in_vimode%3Dfalse.png#only-dark)

### Working as Root

| Option                               | Default | Description                                           |
| :----------------------------------- | :------ | :---------------------------------------------------- |
| **`pure_show_prefix_root_prompt`**   | `false` | `true`: shows prompt prefix when logged in as `root`. |
| **`pure_symbol_prefix_root_prompt`** | `#`     | Prefix prompt when logged in as `root`.               |

=== "Enabled (prefix prompt symbol)"

    ![screenshot pure_show_prefix_root_prompt=true](/pure/assets/screenshots/light-pure_show_prefix_root_prompt%3Dtrue.png#only-light)
    ![screenshot pure_show_prefix_root_prompt=true](/pure/assets/screenshots/mirage-pure_show_prefix_root_prompt%3Dtrue.png#only-dark)

=== "Disabled"

    ![screenshot pure_show_prefix_root_prompt=false](/pure/assets/screenshots/light-pure_show_prefix_root_prompt%3Dfalse.png#only-light)
    ![screenshot pure_show_prefix_root_prompt=false](/pure/assets/screenshots/mirage-pure_show_prefix_root_prompt%3Dfalse.png#only-dark)

[to-set]: https://pure-fish.github.io/pure/#configuration
