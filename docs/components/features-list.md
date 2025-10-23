<!-- markdownlint-disable MD041 -->

### Check For New Release

| Option                           | Default | Description                                               |
| :------------------------------- | :------ | :-------------------------------------------------------- |
| **`pure_check_for_new_release`** | `false` | `true`: check repo for new release (on every shell start) |

!!! success "🐌 Faster Prompt"

    Checking new release send a HTTP request that slow down your prompt rendering
    as it wait for remote server response. Set it to `false` speed up rendering:

    ```fish
    set --universal pure_check_for_new_release false
    ```

=== "Enabled (with update)"

    ![screenshot pure_check_for_new_release=true,with-update](/assets/screenshots/pure_check_for_new_release=true,with-update.png)

=== "Enabled (no update)"

    ![screenshot pure_check_for_new_release=true,no-update](/assets/screenshots/pure_check_for_new_release=true,no-update.png)

### Container Detection (Docker)

| Option                                | Default | Description                                                                                                                                                                    |
| :------------------------------------ | :------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`pure_enable_container_detection`** | `true`  | `false`: Do not check _pure_ runs inside a container (e.g. `docker`, `podman`, `LXC`/`LXD`, etc.).<br/>:warning: Detection is a bit [tricky across OSes][container-detection]. |
| **`pure_symbol_container_prefix`**    |         | Prefix when being inside a container ([to customize][to-set])                                                                                                                  |

[container-detection]: <https://stackoverflow.com/q/23513045/802365>

=== "Enabled (inside a container)"

    ![screenshot pure_enable_container_detection=true,inside](../assets/screenshots/pure_enable_container_detection=true,inside.png) 

=== "Enabled (outside a container)"

    ![screenshot pure_enable_container_detection=true,outside](../assets/screenshots/pure_enable_container_detection=true,outside.png)

### Current Working Directory

| Option                                             | Default | Description                                                                                                          |
| :------------------------------------------------- | :------ | :------------------------------------------------------------------------------------------------------------------- |
| **`pure_begin_prompt_with_current_directory`**     | `true`  | `true`: _`pwd` `git`, `SSH`, duration_.<br/>`false`: _`SSH` `pwd` `git`, duration_.                                  |
| **`pure_shorten_prompt_current_directory_length`** | `0`     | Shorten every prompt path component but the last to X characters (0 do not shorten)                                  |
| **`pure_truncate_prompt_current_directory_keeps`** | `0`     | Truncate working directory path in prompt, but keeps the last to `n` components (`0` full path in current directory) |

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

### Jobs

| Option               | Default | Description                 |
| :------------------- | :------ | :-------------------------- |
| **`pure_show_jobs`** | `false` | Show Number of running jobs |

### Kubernetes

| Option                       | Default | Description                                       |
| :--------------------------- | :------ | :------------------------------------------------ |
| **`pure_symbol_k8s_prefix`** | `☸`     | Prefix when being connected to Kubernetes/K8s     |
| **`pure_enable_k8s`**        | `false` | `true`: shows `kubernetes` context and namespace. |

### NixOS

> Indicate if nix develop shell is activated in their prompt.

| Option                               | Default           | Description                                                                          |
| :----------------------------------- | :---------------- | :----------------------------------------------------------------------------------- |
| **`pure_enable_nixdevshell`**        | `false`           | Indicate if a [`nix develop` shell][nix-dev] is activated (based on `IN_NIX_SHELL`). |
| **`pure_symbol_nixdevshell_prefix`** | `❄️`               | otherwise [nerdfonts](https://www.nerdfonts.com/): '󱄅' or ''                        |
| **`pure_color_nixdevshell_prefix`**  | `pure_color_info` | prefix color                                                                         |
| **`pure_color_nixdevshell_symbol`**  | `pure_color_mute` | symbol color                                                                         |

[nix-dev]: https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-develop.html

### Prompt Symbol

| Option                   | Default | Description    |
| :----------------------- | :------ | :------------- |
| **`pure_symbol_prompt`** | `❯`     | Prompt symbol. |

### Python Virtualenv

| Option                              | Default | Description                                                                  |
| :---------------------------------- | :------ | :--------------------------------------------------------------------------- |
| **`pure_enable_virtualenv`**        | `true`  | Show virtual env name (based on `VIRTUAL_ENV` or `CONDA_DEFAULT_ENV`).       |
| **`pure_symbol_virtualenv_prefix`** |         | Prefix when a Python virtual env is activated (default: [undefined][to-set]) |

### AWS Profile

| Option                               | Default | Description                                                           |
| :----------------------------------- | :------ | :-------------------------------------------------------------------- |
| **`pure_enable_aws_profile`**        | `true`  | Show AWS profile name (based on `AWS_VAULT` or `AWS_PROFILE`).        |
| **`pure_symbol_aws_profile_prefix`** |         | Prefix when a AWS profile is activated (default: [undefined][to-set]) |

### Separate Error Symbol

| Option                              | Default | Description                                                         |
| :---------------------------------- | :------ | :------------------------------------------------------------------ |
| **`pure_separate_prompt_on_error`** | `false` | Show last command [exit code as a second prompt symbol][exit-code]. |

[exit-code]: https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character "See pure-zsh wiki"

### Single Line Prompt

| Option                               | Default | Description                             |
| :----------------------------------- | :------ | :-------------------------------------- |
| **`pure_enable_single_line_prompt`** | `false` | `true`: Compact prompt as a single line |

### SSH Session

| Option                       | Default | Description                                                               |
| :--------------------------- | :------ | :------------------------------------------------------------------------ |
| **`pure_symbol_ssh_prefix`** |         | Prefix when being connected to SSH session (default: [undefined][to-set]) |

### Time & Duration

| Option                                     | Default | Description                                                         |
| :----------------------------------------- | :------ | :------------------------------------------------------------------ |
| **`pure_show_system_time`**                | `false` | `true`: shows system time before the prompt symbol (as `%H:%M:%S`). |
| **`pure_show_subsecond_command_duration`** | `false` | Show subsecond (ex. 1.5s) in command duration.                      |
| **`pure_threshold_command_duration`**      | `5`     | Show command duration when above this value (seconds).              |

### Title

| Option                                                   | Default | Description                                                                                                           |
| :------------------------------------------------------- | :------ | :-------------------------------------------------------------------------------------------------------------------- |
| **`pure_symbol_title_bar_separator`**                    | `-`     | Separator in terminal's windows title.                                                                                |
| **`pure_shorten_window_title_current_directory_length`** | `0`     | Shorten every window title path component but the last to X characters (0 do not shorten)                             |
| **`pure_truncate_window_title_current_directory_keeps`** | `0`     | Truncate working directory path in window title, but keeps the last to `n` components (`0` full path in window title) |

### VI Mode

| Option                                     | Default | Description                                                                                     |
| :----------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_reverse_prompt_symbol_in_vimode`** | `true`  | `true`: `❮` indicate a non-insert mode.<br/>`false`: indicate vi mode with `[I]`, `[N]`, `[V]`. |
| **`pure_symbol_reverse_prompt`**           | `❮`     | VI non-insert mode symbol.                                                                      |

### Working as Root

| Option                               | Default | Description                                           |
| :----------------------------------- | :------ | :---------------------------------------------------- |
| **`pure_show_prefix_root_prompt`**   | `false` | `true`: shows prompt prefix when logged in as `root`. |
| **`pure_symbol_prefix_root_prompt`** | `#`     | Prefix prompt when logged in as `root`.               |

[to-set]: https://pure-fish.github.io/pure/#configuration
