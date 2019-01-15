[travis-link]: https://travis-ci.org/rafaelrinaldi/pure "TravisCI"
[travis-badge]: https://travis-ci.org/rafaelrinaldi/pure.svg?branch=master
[fish-2.5]: https://img.shields.io/badge/fish-v2.5.0-007EC7.svg?style=flat-square "Support Fish 2.5"
[fish-2.6]: https://img.shields.io/badge/fish-v2.6.0-007EC7.svg?style=flat-square "Support Fish 2.6"
[fish-2.7.1]: https://img.shields.io/badge/fish-v2.7.1.0-007EC7.svg?style=flat-square "Support Fish 2.7.1"
[fish-3.0.0]: https://img.shields.io/badge/fish-v3.0.0.0-007EC7.svg?style=flat-square "Support Fish 3.0.0"
[changelog-2.5]: https://github.com/fish-shell/fish-shell/releases/tag/2.5.0 "Changelog Fish 2.5"
[changelog-2.6]: https://github.com/fish-shell/fish-shell/releases/tag/2.6.0 "Changelog Fish 2.6"
[changelog-2.7.1]: https://github.com/fish-shell/fish-shell/releases/tag/2.7.1 "Changelog Fish 2.7.1"
[changelog-3.0.0]: https://github.com/fish-shell/fish-shell/releases/tag/3.0.0 "Changelog Fish 3.0.0"

# pure [![travis-badge]][travis-link] ![fish-2.5] ![fish-2.6] ![fish-2.7.1] ![fish-3.0.0] 

> Pretty, minimal and fast Fish 🐟 prompt, ported from [`zsh`](https://github.com/sindresorhus/pure).


<div align=center>
  <a href="screenshot-dark.png" target=blank><img width=440 src=screenshot-dark.png alt="Pure with dark colorscheme"></a>
  <a href="screenshot-light.png" target=blank><img width=440 src=screenshot-light.png alt="Pure with light colorscheme"></a>
</div>

## Install

**:warning: requirements**: fish `≥2.5`.

### Manually

Via [cURL](https://curl.haxx.se):

```sh
# Download the installer to `/tmp`
curl git.io/pure-fish --output /tmp/pure_installer.fish --location --silent
# Source and trigger the installer
source /tmp/pure_installer.fish; and install_pure
```

### [Fisher](https://github.com/jorgebucaran/fisher)

```fish
fisher add rafaelrinaldi/pure
```

### [Oh My Fish!](https://github.com/oh-my-fish)

```fish
omf install pure
ln -s $OMF_PATH/themes/pure/conf.d/pure.fish ~/.config/fish/conf.d/pure.fish
```

:information_source: [why the symlink?](https://github.com/rafaelrinaldi/pure/wiki/Oh-My-Fish-not-currently-supporting-conf.d-snippets-in-plugins-and-themes)

### [Fundle](https://github.com/tuvistavie/fundle)

```fish
fundle plugin rafaelrinaldi/pure;
fundle install;
```

## Features

- Fully **customizable** ;
- Excellent prompt character `❯` ;
- Display current directory tail ;
- Display `git` branch name ;
  - Display `*` when `git` repository is _dirty_ ;
  - Display `⇡` when branch is _ahead_ (commits to push) ;
  - Display `⇣` when branch is _being_ (commits to pull) ;
- Change `❯` to red when previous command has failed ;
- Update terminal title with _current folder_ and _command_ ;
- Display _username_ and _hostname_ when in an `SSH` session ;
- Display _duration_ when command run more that `5` seconds ;
- Display `Python` _virtualenv_ when activated ;
- Fine control over **colors** ;
- Right prompt control.

## Configuration

You can tweak pretty much everything in `pure` by overriding variables in your `config.fish` file.

### Prompt Symbol
| Option                          | Description    | Default value         |
| :------------------------------ | :------------- | :-------------------- |
| **`pure_symbol_prompt`**        | Prompt symbol. | `❯`                   |
| **`pure_color_symbol_error`**   |                | `$pure_color_red`     |
| **`pure_color_symbol_success`** |                | `$pure_color_magenta` |

### Git

| Option                           | Description                                        | Default value      |
| :------------------------------- | :------------------------------------------------- | :----------------- |
| **`pure_symbol_git_arrow_down`** | Symbol for branch ahead (commits to push).         | `⇣`                |
| **`pure_symbol_git_arrow_up`**   | Symbol for branch being (commits to pull).         | `⇡`                |
| **`pure_symbol_git_dirty`**      | Symbol for dirty repository (uncommitted changes). | `*`                |
| **`pure_color_git_arrows`**      |                                                    | `$pure_color_cyan` |
| **`pure_color_git_branch`**      |                                                    | `$pure_color_gray` |
| **`pure_color_git_dirty`**       |                                                    | `$pure_color_gray` |
:information_source:: Need [safer `git` symbols](https://github.com/sindresorhus/pure/wiki#safer-symbols)?

### Terminal Title
| Option                           | Description                                                                         | Default value |
| :------------------------------- | :---------------------------------------------------------------------------------- | :------------ |
| **`pure_symbol_horizontal_bar`** | Separator for the terminal title between `current working directory` and `command`. | `—`          |

### Base Colors
| Option                   | Default value         |
| :----------------------- | :-------------------- |
| **`pure_color_blue`**    | `(set_color blue)`    |
| **`pure_color_cyan`**    | `(set_color cyan)`    |
| **`pure_color_gray`**    | `(set_color brblack)` |
| **`pure_color_magenta`** | `(set_color magenta)` |
| **`pure_color_normal`**  | `(set_color normal)`  |
| **`pure_color_red`**     | `(set_color red)`     |
| **`pure_color_white`**   | `(set_color white)`   |
| **`pure_color_yellow`**  | `(set_color yellow)`  |

### Components Colors
| Option                           | Default value       |
| :------------------------------- | :------------------ |
| **`pure_color_current_folder`**  | `$pure_color_blue`  |
| **`pure_color_ssh_host`**        | `$pure_color_gray`  |
| **`pure_color_ssh_separator`**   | `$pure_color_gray`  |
| **`pure_color_ssh_user_normal`** | `$pure_color_gray`  |
| **`pure_color_ssh_user_root`**   | `$pure_color_white` |
| **`pure_color_virtualenv`**      | `$pure_color_gray`  |


### Maximum Execution Time
| Option                            | Description                                                                     | Default value        |
| :-------------------------------- | :------------------------------------------------------------------------------ | :------------------- |
| **`pure_command_max_exec_time`**  | Maximum execution time of a process before its run time is shown when it exits. | `5`                  |
| **`pure_color_command_duration`** |                                                                                 | `$pure_color_yellow` |


### Miscellaneous
| Option                                         | Description                                                                                                                                                    | Default value |
| :--------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------ |
| **`pure_prompt_begin_with_current_directory`** | `true`: _current directory_, _git_, _user@hostname (ssh-only)_, _command duration_.<br/>`false`: _user@hostname (ssh-only)_, _current directory_, _git_, _command duration_. | `true`        |
| **`pure_separate_prompt_on_error`**            | Show exit code of last command as a separate prompt character [:information_source:][exit-code]                                                                | `false`       |


[exit-code]: https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character "See pure-zsh wiki"

### Right Prompt
| Option                        | Description             | Default value        |
| :---------------------------- | :---------------------- | :------------------- |
| **`pure_right_prompt`**       | Content of right prompt | `""`                 |
| **`pure_color_right_prompt`** |                         | `$pure_color_normal` |


## Tests

**requirements:** [`fishtape`](https://github.com/fisherman/fishtape).

    fishtape tests/*.test.fish

## Maintainers

- [Rafael Rinaldi](https://github.com/rafaelrinaldi)
- [Édouard Lopez](https://github.com/edouard-lopez)

Kudos to all our awesome [:yellow_heart: contributors :yellow_heart:](../..//graphs/contributors)

## License

MIT © [Rafael Rinaldi](http://rinaldi.io)

---

<p align="center">
  <a href="https://buymeacoff.ee/rinaldi" title="Buy me a coffee">Buy me a ☕</a>
</p>
