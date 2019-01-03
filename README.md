[travis-link]: https://travis-ci.org/rafaelrinaldi/pure
[travis-badge]: https://travis-ci.org/rafaelrinaldi/pure.svg?branch=master

# pure [![Fish Shell Version](https://img.shields.io/badge/fish-v2.5.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Build Status][travis-badge]][travis-link]

> Port of the [`pure`](https://github.com/sindresorhus/pure) ZSH theme to Fish 🐟

<p align=center>
  <img width=585 src=screenshot.png>
</p>

## Install

**:warning: requirements**: fish `≥2.4`.

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

- Fully customizable
- Display current directory tail
- Display Git branch name
- Display whether or not the working copy is dirty
- Display ⇡ if there are stuff to be pushed
- Display ⇣ if there are stuff to be pulled
- Display prompt symbol in red if previous command has failed
- Display the current folder and command when a process is running
- Display username and host when in an SSH session
- Display duration of failed process (defaults to `5`)
- Display python virtualenv name if activated

## Configuration

You can tweak pretty much everything in `pure` by overriding variables in your `config.fish` file.

```fish
# Symbols
set pure_symbol_prompt "❯"

# Git
set pure_symbol_git_arrow_down "⇣"
set pure_symbol_git_arrow_up "⇡"
set pure_symbol_git_dirty "*"

# Title
set pure_symbol_horizontal_bar "—"

# Base colors
set pure_color_blue (set_color blue)
set pure_color_cyan (set_color cyan)
set pure_color_gray (set_color 93A1A1)
set pure_color_magenta (set_color magenta)
set pure_color_normal (set_color normal)
set pure_color_red (set_color red)
set pure_color_white (set_color white)
set pure_color_yellow (set_color yellow)

# Colors used on symbols, attributes and events
set pure_color_git_branch $pure_color_gray
set pure_color_git_dirty $pure_color_gray
set pure_color_git_arrows $pure_color_cyan
set pure_color_command_duration (set_color --background blue)
set pure_color_ssh_user_normal $pure_color_gray
set pure_color_ssh_user_root $pure_color_white
set pure_color_ssh_separator $pure_color_gray
set pure_color_ssh_host $pure_color_gray
set pure_color_virtualenv $pure_color_gray
set pure_color_success (set_color green)
set pure_color_error (set_color magenta)

# Print current working directory at the beginning of prompt
# true (default):   current directory, git, user@hostname (ssh-only), command duration
# false:            user@hostname (ssh-only), current directory, git, command duration
set pure_prompt_begin_with_current_directory true

# Show exit code of last command as a separate prompt character (cf. https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character)
# false - single prompt character, default
# true - separate prompt character
set pure_separate_prompt_on_error false

# Max execution time of a process before its run time is shown when it exits
set pure_command_max_exec_time 5
```

## Tests

**requirements:** [`fishtape`](https://github.com/fisherman/fishtape).

    fishtape tests/*.test.fish

Refer to [tools/installer.md](./tools/installer.md) to test the installer script.

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
