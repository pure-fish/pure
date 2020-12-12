> ##### ✋ Psst! Migrating from v1.x to v2.x? We got you. Check our [**migration guide**](https://github.com/rafaelrinaldi/pure/releases/tag/v2.0.0) and happy upgrading

# pure [![github-ci-badge]][github-ci-link] ![fish-3]

> Pretty, minimal and fast Fish 🐟 prompt, ported from [`zsh`](https://github.com/sindresorhus/pure).

<div align=center>
  <a href="https://camo.githubusercontent.com/be014be282ef66e5c5cad19458aa61d7df6865ecbe55bcc882e0d53580f81de9/68747470733a2f2f692e696d6775722e636f6d2f424878556f68522e706e67" target=blank><img width=440 src=https://camo.githubusercontent.com/be014be282ef66e5c5cad19458aa61d7df6865ecbe55bcc882e0d53580f81de9/68747470733a2f2f692e696d6775722e636f6d2f424878556f68522e706e67 alt="Pure with dark colorscheme"></a>
  <a href="https://camo.githubusercontent.com/5934e8c1d3b5f9218d05d5e1741e23963a7803d6098236d36e586336a6c6a5b7/68747470733a2f2f692e696d6775722e636f6d2f714a646f6e716f2e706e67" target=blank><img width=440 src=https://camo.githubusercontent.com/5934e8c1d3b5f9218d05d5e1741e23963a7803d6098236d36e586336a6c6a5b7/68747470733a2f2f692e696d6775722e636f6d2f714a646f6e716f2e706e67 alt="Pure with light colorscheme"></a>
</div>

## :rocket: Install

**:warning: requirements**: fish `≥3.x`

### [Fisher](https://github.com/jorgebucaran/fisher)

```fish
fisher install rafaelrinaldi/pure
```

### [Oh My Fish!](https://github.com/oh-my-fish)

```fish
omf install pure
ln -s $OMF_PATH/themes/pure/conf.d/pure.fish ~/.config/fish/conf.d/pure.fish
ln -s $OMF_PATH/themes/pure/conf.d/_pure_init.fish ~/.config/fish/conf.d/pure_init.fish
```

:information_source: [why the symlink?](https://github.com/rafaelrinaldi/pure/wiki/Oh-My-Fish-not-currently-supporting-conf.d-snippets-in-plugins-and-themes)

### [Fundle](https://github.com/danhper/fundle)

```fish
fundle plugin rafaelrinaldi/pure
fundle install
```

### Manually

Via [cURL](https://curl.haxx.se):

```sh
# Download the installer to `/tmp`
curl git.io/pure-fish --output /tmp/pure_installer.fish --location --silent
# Source and trigger the installer
source /tmp/pure_installer.fish; and install_pure
```

## Features

- Fully **customizable** ;
- Excellent prompt character `❯` ;
- Display current directory tail ;
- Display `git` branch name ;
  - Display `*` when `git` repository is _dirty_ ;
  - Display `≡` when `git` repository is _stashed_ ;
  - Display `⇡` when branch is _ahead_ (commits to push) ;
  - Display `⇣` when branch is _behind_ (commits to pull) ;
- Change `❯` to red when previous command has failed ;
- Update terminal title with _current folder_ and _command_ ;
- Display _username_ and _hostname_ when in an `SSH` session ;
- Display _duration_ when command run more that `5` seconds ;
- Display `Python` _virtualenv_ when activated ;
- Fine control over **colors** ;
- Display `VI` mode and custom symbol for non-insert mode.
- Show system time
- Show number of running jobs
- Print current working directory at the beginning of prompt
- Can check for new release on start

## :paintbrush: Configuration

You can tweak `pure` behavior by changing [universal variables](https://fishshell.com/docs/current/tutorial.html#tut_universal) directly in the terminal:

    set --universal pure_show_system_time true

or changing the defaults in your `config.fish`:

    _pure_set_default pure_show_system_time true

### Prompt Symbol

| Option                                 | Default | Description                                          |
| :------------------------------------- | :------ | :--------------------------------------------------- |
| **`pure_symbol_git_dirty`**            | `*`     | Repository is Dirty (uncommitted/untracked changes). |
| **`pure_symbol_git_unpulled_commits`** | `⇣`     | Branch is behind upstream (commits to pull).         |
| **`pure_symbol_git_unpushed_commits`** | `⇡`     | Branch is ahead upstream (commits to push).          |
| **`pure_symbol_prompt`**               | `❯`     | Prompt symbol.                                       |
| **`pure_symbol_reverse_prompt`**       | `❮`     | VI non-insert mode symbol.                           |
| **`pure_symbol_title_bar_separator`**  | `-`     |
:information_source:: Need [safer `git` symbols](https://github.com/sindresorhus/pure/wiki#safer-symbols)?

### Features

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_begin_prompt_with_current_directory`** | `true`  | `true`: _`pwd` `git`, `SSH`, duration_.<br/>`false`: _`SSH` `pwd` `git`, duration_.             |
| **`pure_check_for_new_release`**               | `false` | `true`: check repo for new release (on every shell start)                                       |
| **`pure_enable_git`**                          | `true`  | Show info about Git repository.                                                                 |
| **`pure_reverse_prompt_symbol_in_vimode`**     | `true`  | `true`: `❮` indicate a non-insert mode.<br/>`false`: indicate vi mode with `[I]`, `[N]`, `[V]`. |
| **`pure_separate_prompt_on_error`**            | `false` | Show last command [exit code as a separate character][exit-code].                               |
| **`pure_show_jobs`**                           | `false` | Show Number of running jobs                                                                     |
| **`pure_show_subsecond_command_duration`**     | `false` | Show subsecond (ex. 1.5s) in command duration.                                                  |
| **`pure_show_system_time`**                    | `false` | `true`: shows system time before the prompt symbol (as `%H:%M:%S`).                             |
| **`pure_threshold_command_duration`**          | `5`     | Show command duration when above this value (seconds).                                          |

### Colors

You can configure `pure` colors by changing the values of variables below. The value of these variables can be one of the colors accepted by the [`set_color`](https://fishshell.com/docs/current/commands.html#set_color) command (including various options like `--background`, `-o`, `--underline`, etc.):

```fish
set pure_color_success 6638F0 --italics
```

Variables regulating color for certain features from the second column can also accept one of the base color names:

```fish
set pure_color_ssh_user_root pure_color_dark
```

Take a note on the absence of `$` sign before the second argument in this case. By default all feature colors inherit their values from base colors.

| Base Color               | Inherited by                                                                                                                                                                                                                  | Default   |
| :----------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| **`pure_color_primary`** | **`pure_color_current_directory`**                                                                                                                                                                                            | `blue`    |
| **`pure_color_info`**    | **`pure_color_git_unpulled_commits`**<br>**`pure_color_git_unpushed_commits`**                                                                                                                                                | `cyan`    |
| **`pure_color_mute`**    | **`pure_color_git_branch`**<br>**`pure_color_git_dirty`**<br>**`pure_color_git_stash`**<br>**`pure_color_ssh_hostname`**<br>**`pure_color_ssh_separator`**<br>**`pure_color_ssh_user_normal`**<br>**`pure_color_virtualenv`** | `brblack` |
| **`pure_color_success`** | **`pure_color_prompt_on_success`**                                                                                                                                                                                            | `magenta` |
| **`pure_color_normal`**  | **`pure_color_jobs`**                                                                                                                                                                                                         | `normal`  |
| **`pure_color_danger`**  | **`pure_color_prompt_on_error`**                                                                                                                                                                                              | `red`     |
| **`pure_color_light`**   | **`pure_color_ssh_user_root`**                                                                                                                                                                                                | `white`   |
| **`pure_color_warning`** | **`pure_color_command_duration`**                                                                                                                                                                                             | `yellow`  |
| **`pure_color_dark`**    |                                                                                                                                                                                                                               | `black`   |

## :+1:  Contribute

**requirements:** [`docker`](https://docs.docker.com/install/) (isolate from your environment)

Specify the [`FISH_VERSION`][fish-releases] you want, and the `CMD` executed by the container:

    make build-pure-on FISH_VERSION=3.0.0
    make dev-pure-on FISH_VERSION=3.0.0 CMD="fishtape tests/*.test.fish"

## :man_technologist: Maintainer

- [Édouard Lopez](https://github.com/edouard-lopez)

## :clap: Thanks

* [@andreiborisov](https://github.com/andreiborisov) for the [docker images][docker-images] ;
* [@jorgebucaran](https://github.com/jorgebucaran/) for [fishtape](https://github.com/jorgebucaran/fishtape) ;
* [@rafaelrinaldi](https://github.com/rafaelrinaldi/pure) for starting the project ;

## :classical_building: License

[MIT][MIT]

[github-ci-link]: <https://github.com/rafaelrinaldi/pure/actions> "Github CI"
[github-ci-badge]: <https://github.com/rafaelrinaldi/pure/workflows/Run%20tests%20on%20CI/badge.svg>
[fish-3]: <https://img.shields.io/badge/fish-v3-007EC7.svg?style=flat-square> "Support Fish 3"
[exit-code]: <https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character> "See pure-zsh wiki"
[fish-releases]: https://github.com/fish-shell/fish-shell/releases
[docker-images]: https://github.com/andreiborisov/docker-fish/
[MIT]: LICENSE.md
