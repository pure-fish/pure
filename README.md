# pure [![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)

> Port of the [`pure`](/sindresorhus/pure) ZSH theme to Fish

<p align="center">
  <img width="572" src="screenshot.png">
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
$ fisher install pure
```

### [Oh My Fish!](https://github.com/oh-my-fish)

```fish
$ omf install pure
```

## Features

* Display current directory tail
* Display Git branch name
* Display whether or not the working copy is dirty
* Display an up arrow if there are stuff to be pushed
* Display an down arrow if there are stuff to be pulled
* Display prompt symbol in red if previous command has failed
* Display the current folder and command when a process is running
* Display username and host when in an SSH session
* Display duration of failed commands (if timeout is greather than default threshold)

## Maintainers

* [Rafael Rinaldi](/rafaelrinaldi)
* [Édouard Lopez](/edouard-lopez)

Kudos to all our awesome [:yellow_heart: contributors :yellow_heart:](/graphs/contributors)

## License

MIT © [Rafael Rinaldi](http://rinaldi.io)
