# pure [![Fish Shell Version](https://img.shields.io/badge/fish-v2.5.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Build Status][travis-badge]][travis-link]

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
* Display python virtualenv name if activated

## Configuration

You can tweak pretty much everything in `pure` by overriding variables in your `config.fish` file:

```fish
# Change the prompt text
set pure_symbol_prompt "~>"
set pure_symbol_git_down_arrow "v"
set pure_symbol_git_up_arrow "^"
set pure_symbol_git_dirty "!"
set pure_symbol_horizontal_bar "_"

# Change the base colors
set pure_color_red (set_color red)
set pure_color_magenta (set_color magenta)
set pure_color_blue (set_color blue)
set pure_color_yellow (set_color yellow)
set pure_color_cyan (set_color cyan)
set pure_color_gray (set_color 93A1A1)
set pure_color_white (set_color white)
set pure_color_normal (set_color normal)

# Change the colors used on symbols, attributes and events
set pure_color_success (set_color green)
set pure_color_error (set_color magenta)
set pure_color_folder (set_color yellow)
set pure_color_duration (set_color --background blue)
set pure_color_git_dirty $pure_color_gray
set pure_color_git_branch $pure_color_gray
set pure_color_git_arrow $pure_color_cyan
set pure_color_virtualenv $pure_color_gray
set pure_color_ssh_username $pure_color_gray
set pure_color_ssh_host $pure_color_gray
set pure_color_ssh_root $pure_color_white
set pure_color_ssh_host_user_seperator $pure_color_gray

# Change where the username and host is displayed
# 0 - end of prompt, default
# 1 - start of prompt
# Any other value defaults to the default behaviour
set pure_user_host_location 1

# Show exit code of last command as a separate prompt character. As described here: https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character
# 0 - single prompt character, default
# 1 - separate prompt character
# Any other value defaults to the default behaviour
set pure_separate_prompt_on_error 1

# Max execution time of a process before its run time is shown when it exits
set pure_command_max_exec_time 5
```

## Tests

**requirements:** [`fishtape`](https://github.com/fisherman/fishtape).

    fishtape tests/*.test.fish

## Maintainers

* [Rafael Rinaldi](https://github.com/rafaelrinaldi)
* [Édouard Lopez](https://github.com/edouard-lopez)

Kudos to all our awesome [:yellow_heart: contributors :yellow_heart:](../..//graphs/contributors)

## License

MIT © [Rafael Rinaldi](http://rinaldi.io)

[travis-link]: https://travis-ci.org/rafaelrinaldi/pure
[travis-badge]: https://img.shields.io/travis/rafaelrinaldi/pure.svg
