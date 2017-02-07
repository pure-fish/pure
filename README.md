# pure [![Fish Shell Version](https://img.shields.io/badge/fish-v2.5.0-007EC7.svg?style=flat-square)](http://fishshell.com)

> Port of the [`pure`](https://github.com/sindresorhus/pure) ZSH theme to Fish 🐟

<p align=center>
  <img width=585 src=screenshot.png>
</p>

## Install

### Manually

Via [cURL](https://curl.haxx.se):

```sh
$ # Download the installer to `/tmp`
$ curl -Ls https://raw.github.com/rafaelrinaldi/pure/master/installer.fish > /tmp/pure_installer.fish
$ # Source and trigger the installer
$ source /tmp/pure_installer.fish; and install_pure
```

### [Fisherman](http://fisherman.sh)

```fish
$ fisher rafaelrinaldi/pure
```

### [Oh My Fish!](https://github.com/oh-my-fish)

```fish
$ omf install pure
```

## Features

* Fully customizable
* Display current directory tail
* Display Git branch name
* Display whether or not the working copy is dirty
* Display ⇡ if there are stuff to be pushed
* Display ⇣ if there are stuff to be pulled
* Display prompt symbol in red if previous command has failed
* Display the current folder and command when a process is running
* Display username and host when in an SSH session
* Display duration of failed process (defaults to `5`)

## Configuration

You can tweak pretty much everything in `pure` by overriding variables in your `config.fish` file:

```fish
# Change the prompt text
set pure_symbol_prompt "~>"
set pure_symbol_git_down_arrow "v"
set pure_symbol_git_up_arrow "^"
set pure_symbol_git_dirty "!"
set pure_symbol_horizontal_bar "_"

# Change the colors
set pure_color_blue (set_color "1e00fd")
set pure_color_cyan (set_color "1e95fd")
set pure_color_gray (set_color "6c6c6c")
set pure_color_green (set_color "66ff66")
set pure_color_normal (set_color "000000")
set pure_color_red (set_color "f820ff")
set pure_color_yellow (set_color "1bc8c8")

# Max execution time of a process before its run time is shown when it exits
set pure_command_max_exec_time 5
```

## Maintainers

* [Rafael Rinaldi](https://github.com/rafaelrinaldi)
* [Édouard Lopez](https://github.com/edouard-lopez)

Kudos to all our awesome [:yellow_heart: contributors :yellow_heart:](../..//graphs/contributors)

## License

MIT © [Rafael Rinaldi](http://rinaldi.io)
