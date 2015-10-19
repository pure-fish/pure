# Pure

> Port of the [`pure`](https://github.com/sindresorhus/pure) ZSH theme to Fish

<img width="572" src="screenshot.png">

## Install

```sh
$ set -l ffns (echo $HOME/.config/fish/functions)
$ curl -Ls https://raw.github.com/rafaelrinaldi/pure/master/fish_prompt.fish > $ffns/fish_prompt.fish
$ . $ffns/fish_prompt.fish
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

## License

MIT © [Rafael Rinaldi](http://rinaldi.io)
