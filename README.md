# Pure

> Port of the [`pure`](https://github.com/sindresorhus/pure) ZSH theme to Fish.

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)

<br/>

## Screenshot

<p align="center">
<img width="572" src="screenshot.png">
</p>

## Install

### Fisherman

```fish
fisher install pure
```

### Oh-My-Fish

```fish
omf install pure
```

### Manually

#### via `curl`

```sh
fish -c "$(curl -fsSL https://github.com/rafaelrinaldi/theme-pure/master/installer.fish)"
```

#### via `wget`

```sh
fish -c "$(wget https://github.com/rafaelrinaldi/theme-pure/master/installer.fish -O -)"
```

## Features

- [x] Display current directory tail
- [x] Display Git branch name
- [x] Display whether or not the working copy is dirty
- [x] Display an up arrow if there are stuff to be pushed
- [x] Display an down arrow if there are stuff to be pulled
- [x] Display prompt symbol in red if previous command has failed
- [x] Display the current folder and command when a process is running
- [x] Display username and host when in an SSH session
- [x] Display duration of failed commands

## Contributors

* [Rafael Rinaldi](https://github.com/rafaelrinaldi/pure) ;
* [Édouard Lopez](https://github.com/edouard-lopez/).

## License

[MIT][mit] © [Rafael Rinaldi][author] et [al][contributors].

[mit]:            http://opensource.org/licenses/MIT
[author]:         http://rinaldi.io
[contributors]:   https://github.com/rafaelrinaldi/pure/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
