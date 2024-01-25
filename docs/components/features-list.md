### Prompt Symbol

| Option                   | Default | Description    |
| :----------------------- | :------ | :------------- |
| **`pure_symbol_prompt`** | `❯`     | Prompt symbol. |

### Git

| Option                                 | Default | Description                                          |
| :------------------------------------- | :------ | :--------------------------------------------------- |
| **`pure_enable_git`**                  | `true`  | Show info about Git repository.                      |
| **`pure_symbol_git_dirty`**            | `*`     | Repository is Dirty (uncommitted/untracked changes). |
| **`pure_symbol_git_stash`**            | `≡`     | Repository git stash status.                         |
| **`pure_symbol_git_unpulled_commits`** | `⇣`     | Branch is behind upstream (commits to pull).         |
| **`pure_symbol_git_unpushed_commits`** | `⇡`     | Branch is ahead upstream (commits to push).          |

> :information_source: Need [safer `git` symbols](https://github.com/sindresorhus/pure/wiki/Customizations,-hacks-and-tweaks#safer-symbols)?

### Kubernetes

| Option                       | Default | Description                                       |
| :--------------------------- | :------ | :------------------------------------------------ |
| **`pure_symbol_k8s_prefix`** | `☸`     | Prefix when being connected to Kubernetes/K8s     |
| **`pure_enable_k8s`**        | `false` | `true`: shows `kubernetes` context and namespace. |

### VI Mode

| Option                                     | Default | Description                                                                                     |
| :----------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_reverse_prompt_symbol_in_vimode`** | `true`  | `true`: `❮` indicate a non-insert mode.<br/>`false`: indicate vi mode with `[I]`, `[N]`, `[V]`. |
| **`pure_symbol_reverse_prompt`**           | `❮`     | VI non-insert mode symbol.                                                                      |

### Container Detection (Docker)

| Option                                | Default | Description                                                                                                                                                                    |
| :------------------------------------ | :------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`pure_enable_container_detection`** | `true`  | `false`: Do not check _pure_ runs inside a container (e.g. `docker`, `podman`, `LXC`/`LXD`, etc.).<br/>:warning: Detection is a bit [tricky across OSes][container-detection]. |
| **`pure_symbol_container_prefix`**    |         | Prefix when being inside a container ([to customize][to-set])                                                                                                                  |

### Working as Root

| Option                               | Default | Description                                           |
| :----------------------------------- | :------ | :---------------------------------------------------- |
| **`pure_show_prefix_root_prompt`**   | `false` | `true`: shows prompt prefix when logged in as `root`. |
| **`pure_symbol_prefix_root_prompt`** | `#`     | Prefix prompt when logged in as `root`.               |

### SSH Session

| Option                       | Default | Description                                                               |
| :--------------------------- | :------ | :------------------------------------------------------------------------ |
| **`pure_symbol_ssh_prefix`** |         | Prefix when being connected to SSH session (default: [undefined][to-set]) |

### Python Virtualenv

| Option                              | Default | Description                                                                  |
| :---------------------------------- | :------ | :--------------------------------------------------------------------------- |
| **`pure_enable_virtualenv`**        | `true`  | Show virtual env name (based on `VIRTUAL_ENV` or `CONDA_DEFAULT_ENV`).       |
| **`pure_symbol_virtualenv_prefix`** |         | Prefix when a Python virtual env is activated (default: [undefined][to-set]) |

### Time & Duration

| Option                                     | Default | Description                                                         |
| :----------------------------------------- | :------ | :------------------------------------------------------------------ |
| **`pure_show_system_time`**                | `false` | `true`: shows system time before the prompt symbol (as `%H:%M:%S`). |
| **`pure_show_subsecond_command_duration`** | `false` | Show subsecond (ex. 1.5s) in command duration.                      |
| **`pure_threshold_command_duration`**      | `5`     | Show command duration when above this value (seconds).              |

### Title

| Option                                                   | Default | Description                                                                               |
| :------------------------------------------------------- | :------ | :---------------------------------------------------------------------------------------- |
| **`pure_symbol_title_bar_separator`**                    | `-`     | Separator in terminal's windows title.                                                    |
| **`pure_shorten_window_title_current_directory_length`** | `0`     | Shorten every window title path component but the last to X characters (0 do not shorten) |

### Current Working Directory

| Option                                             | Default | Description                                                                         |
| :------------------------------------------------- | :------ | :---------------------------------------------------------------------------------- |
| **`pure_begin_prompt_with_current_directory`**     | `true`  | `true`: _`pwd` `git`, `SSH`, duration_.<br/>`false`: _`SSH` `pwd` `git`, duration_. |
| **`pure_shorten_prompt_current_directory_length`** | `0`     | Shorten every prompt path component but the last to X characters (0 do not shorten) |

### Check For New Release

| Option                           | Default | Description                                               |
| :------------------------------- | :------ | :-------------------------------------------------------- |
| **`pure_check_for_new_release`** | `false` | `true`: check repo for new release (on every shell start) |

### Single Line Prompt

| Option                               | Default | Description                             |
| :----------------------------------- | :------ | :-------------------------------------- |
| **`pure_enable_single_line_prompt`** | `false` | `true`: Compact prompt as a single line |

### Separate Error Symbol

| Option                              | Default | Description                                                         |
| :---------------------------------- | :------ | :------------------------------------------------------------------ |
| **`pure_separate_prompt_on_error`** | `false` | Show last command [exit code as a second prompt symbol][exit-code]. |

### Jobs

| Option               | Default | Description                 |
| :------------------- | :------ | :-------------------------- |
| **`pure_show_jobs`** | `false` | Show Number of running jobs |

### NixOS

> Indicate if nix develop shell is activated in their prompt.

| Option                               | Default           | Description                                                                          |
| :----------------------------------- | :---------------- | :----------------------------------------------------------------------------------- |
| **`pure_enable_nixdevshell`**        | `false`           | Indicate if a [`nix develop` shell][nix-dev] is activated (based on `IN_NIX_SHELL`). |
| **`pure_symbol_nixdevshell_prefix`** | `❄️`               | otherwise [nerdfonts](https://www.nerdfonts.com/): '󱄅' or ''                        |
| **`pure_color_nixdevshell_prefix`**  | `pure_color_info` | prefix color                                                                         |
| **`pure_color_nixdevshell_symbol`**  | `pure_color_mute` | symbol color                                                                         |

[nix-dev]: https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-develop.html
