> ##### ✋ Psst! Migrating from v1.x to v2.x? We got you. Check our [**migration guide**](https://github.com/rafaelrinaldi/pure/releases/tag/v2.0.0) and happy upgrading!

# pure [![travis-badge]][travis-link] ![fish-2.5] ![fish-2.6] ![fish-2.7.1] ![fish-3.0.0]

> Pretty, minimal and fast Fish 🐟 prompt, ported from [`zsh`](https://github.com/sindresorhus/pure).

<div align=center>
  <a href="screenshot-dark.png" target=blank><img width=440 src=https://i.imgur.com/BHxUohR.png alt="Pure with dark colorscheme"></a>
  <a href="screenshot-light.png" target=blank><img width=440 src=https://i.imgur.com/qJdonqo.png alt="Pure with light colorscheme"></a>
</div>

## Install

**:warning: requirements**: fish `≥2.5`

### [Fisher](https://github.com/jorgebucaran/fisher)

```fish
fisher add rafaelrinaldi/pure
```

### [Oh My Fish!](https://github.com/oh-my-fish)

```fish
omf install pure
ln -s $OMF_PATH/themes/pure/conf.d/pure.fish ~/.config/fish/conf.d/pure.fish
ln -s $OMF_PATH/themes/pure/conf.d/_pure_init.fish ~/.config/fish/conf.d/pure_init.fish
```

:information_source: [why the symlink?](https://github.com/rafaelrinaldi/pure/wiki/Oh-My-Fish-not-currently-supporting-conf.d-snippets-in-plugins-and-themes)

### [Fundle](https://github.com/tuvistavie/fundle)

```fish
fundle plugin rafaelrinaldi/pure;
fundle install;
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

-   Fully **customizable** ;
-   Excellent prompt character `❯` ;
-   Display current directory tail ;
-   Display `git` branch name ;
    -   Display `*` when `git` repository is _dirty_ ;
    -   Display `⇡` when branch is _ahead_ (commits to push) ;
    -   Display `⇣` when branch is _behind_ (commits to pull) ;
-   Change `❯` to red when previous command has failed ;
-   Update terminal title with _current folder_ and _command_ ;
-   Display _username_ and _hostname_ when in an `SSH` session ;
-   Display _duration_ when command run more that `5` seconds ;
-   Display `Python` _virtualenv_ when activated ;
-   Fine control over **colors** ;
-   Display `VI` mode and custom symbol for non-insert mode.

## Configuration

You can tweak pretty much everything in `pure` by overriding defaults with global variables in your `config.fish` file:

```
set -g pure_symbol_prompt ">"
```

or by changing [universal variables](https://fishshell.com/docs/current/tutorial.html#tut_universal) directly in the terminal (which will be preserved between all `fish` sessions on the computer):

```
set -U pure_symbol_prompt ">"
```

#### Prompt Symbol

| Option                                 | Default | Description                                          |
| :------------------------------------- | :------ | :--------------------------------------------------- |
| **`pure_symbol_prompt`**               | `❯`     | Prompt symbol.                                       |
| **`pure_symbol_reverse_prompt`**       | `❮`     | VI non-insert mode symbol.                           |
| **`pure_symbol_git_unpulled_commits`** | `⇣`     | Branch is behind upstream (commits to pull).         |
| **`pure_symbol_git_unpushed_commits`** | `⇡`     | Branch is ahead upstream (commits to push).          |
| **`pure_symbol_git_dirty`**            | `*`     | Repository is Dirty (uncommitted/untracked changes). |
| **`pure_symbol_title_bar_separator`**  | `—`     |

:information_source:: Need [safer `git` symbols](https://github.com/sindresorhus/pure/wiki#safer-symbols)?

#### Features

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_enable_git`**                          | `true`  | Show info about Git repository.                                                                 |
| **`pure_threshold_command_duration`**          | `5`     | Show command duration when above this value (seconds).                                          |
| **`pure_separate_prompt_on_error`**            | `false` | Show last command [exit code as a separate character][exit-code].                               |
| **`pure_begin_prompt_with_current_directory`** | `true`  | `true`: _`pwd` `git`, `SSH`, duration_.<br/>`false`: _`SSH` `pwd` `git`, duration_.             |
| **`pure_reverse_prompt_symbol_in_vimode`**     | `true`  | `true`: `❮` indicate a non-insert mode.<br/>`false`: indicate vi mode with `[I]`, `[N]`, `[V]`. |

#### Colors

You can configure `pure` colors by changing the values of variables below. The value of these variables can be one of the colors accepted by the [`set_color`](https://fishshell.com/docs/current/commands.html#set_color) command (including various options like `--background`, `-o`, `--underline`, etc.):

```
set pure_color_success 6638F0 --italics
```

Variables regulating color for certain features from the second column can also accept one of the base color names:

```
set pure_color_ssh_user_root pure_color_dark
```

Take a note on the absence of `$` sign before the second argument in this case. By default all feature colors inherit their values from base colors.

| Base Color               | Inherited by                                                                                                                                                                                    | Default   |
| :----------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| **`pure_color_primary`** | **`pure_color_current_directory`**                                                                                                                                                              | `blue`    |
| **`pure_color_info`**    | **`pure_color_git_unpulled_commits`**<br>**`pure_color_git_unpushed_commits`**                                                                                                                  | `cyan`    |
| **`pure_color_mute`**    | **`pure_color_git_branch`**<br>**`pure_color_git_dirty`**<br>**`pure_color_ssh_hostname`**<br>**`pure_color_ssh_separator`**<br>**`pure_color_ssh_user_normal`**<br>**`pure_color_virtualenv`** | `brblack` |
| **`pure_color_success`** | **`pure_color_prompt_on_success`**                                                                                                                                                              | `magenta` |
| **`pure_color_normal`**  | **`pure_color_jobs`**                                                                                                                                                                           | `normal`  |
| **`pure_color_danger`**  | **`pure_color_prompt_on_error`**                                                                                                                                                                | `red`     |
| **`pure_color_light`**   | **`pure_color_ssh_user_root`**                                                                                                                                                                  | `white`   |
| **`pure_color_warning`** | **`pure_color_command_duration`**                                                                                                                                                               | `yellow`  |
| **`pure_color_dark`**    |                                                                                                                                                                                                 | `black`   |

## Tests

**requirements:** [`fishtape`](https://github.com/fisherman/fishtape).

    fishtape tests/*.test.fish

## Maintainers

-   [Rafael Rinaldi](https://github.com/rafaelrinaldi)
-   [Édouard Lopez](https://github.com/edouard-lopez)
-   [Andrei Borisov](https://github.com/schrodincat)

Kudos to all our awesome [:yellow_heart: contributors :yellow_heart:](../..//graphs/contributors)

## License

MIT © [Rafael Rinaldi](http://rinaldi.io)

---

<p align="center">
<a href="https://buymeacoff.ee/rinaldi" title="Buy me a coffee">Buy me a ☕</a>
</p>

[travis-link]: https://travis-ci.org/rafaelrinaldi/pure "TravisCI"
[travis-badge]: https://travis-ci.org/rafaelrinaldi/pure.svg?branch=master
[fish-2.5]: https://img.shields.io/badge/fish-v2.5.0-007EC7.svg?style=flat-square "Support Fish 2.5"
[fish-2.6]: https://img.shields.io/badge/fish-v2.6.0-007EC7.svg?style=flat-square "Support Fish 2.6"
[fish-2.7.1]: https://img.shields.io/badge/fish-v2.7.1-007EC7.svg?style=flat-square "Support Fish 2.7.1"
[fish-3.0.0]: https://img.shields.io/badge/fish-v3.0.0-007EC7.svg?style=flat-square "Support Fish 3.0.0"
[changelog-2.5]: https://github.com/fish-shell/fish-shell/releases/tag/2.5.0 "Changelog Fish 2.5"
[changelog-2.6]: https://github.com/fish-shell/fish-shell/releases/tag/2.6.0 "Changelog Fish 2.6"
[changelog-2.7.1]: https://github.com/fish-shell/fish-shell/releases/tag/2.7.1 "Changelog Fish 2.7.1"
[changelog-3.0.0]: https://github.com/fish-shell/fish-shell/releases/tag/3.0.0 "Changelog Fish 3.0.0"
[exit-code]: https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character "See pure-zsh wiki"
