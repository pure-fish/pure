<div align="center">

<img src="https://user-images.githubusercontent.com/1212392/262604075-db5d0ad2-a7ed-4a62-a1cc-ec677cf76351.png" width="61.8%"/><br>

[![ci-status]][ci-link] ![fish-3] [![release-version]][release-link] [![sponsors]][sponsor-link] <!-- 0 width spaces on this line -->

</div>

# pure  `❯❮❯`

> Pretty, minimal and fast Fish 🐟 prompt, ported from [`zsh`](https://github.com/sindresorhus/pure).

<div align=center>
  <a href="https://camo.githubusercontent.com/be014be282ef66e5c5cad19458aa61d7df6865ecbe55bcc882e0d53580f81de9/68747470733a2f2f692e696d6775722e636f6d2f424878556f68522e706e67" target=blank><img width=440 src=https://camo.githubusercontent.com/be014be282ef66e5c5cad19458aa61d7df6865ecbe55bcc882e0d53580f81de9/68747470733a2f2f692e696d6775722e636f6d2f424878556f68522e706e67 alt="Pure with dark colorscheme"></a>
  <a href="https://camo.githubusercontent.com/5934e8c1d3b5f9218d05d5e1741e23963a7803d6098236d36e586336a6c6a5b7/68747470733a2f2f692e696d6775722e636f6d2f714a646f6e716f2e706e67" target=blank><img width=440 src=https://camo.githubusercontent.com/5934e8c1d3b5f9218d05d5e1741e23963a7803d6098236d36e586336a6c6a5b7/68747470733a2f2f692e696d6775722e636f6d2f714a646f6e716f2e706e67 alt="Pure with light colorscheme"></a>
</div>

## Documentation

:sparkles: Check-out our [brand-new documentation][doc] for configurations, features and colours as well as contributing guide.

## :rocket: Install

**:warning: requirements**: fish `≥3.x`, [fisher](https://github.com/jorgebucaran/fisher):

```shell
fisher install pure-fish/pure
```

## Features

Fully **customizable** (colors, symbols and features):

- Excellent prompt character `❯` :
  - Change `❯` to red when previous command has failed ;
  - Start prompt with _current working directory_ 🏴 ;
  - Compact-mode (single-line prompt) 🏴 ;
- Display _current folder_  tail ;
- check for new release on start 🏴 ;
- Display _username_ and _hostname_ when in an `SSH` session ;
- Display command _duration_ when longer than `5` seconds ;
- Display `nix develop` shell indicator when activated 🏴 ;
- Display `Python` _virtualenv_ when activated 🏴 ;
- Display `VI` mode and custom symbol for non-insert mode 🏴 ;
- Display `kubernetes` context and namespace
- Display container indicator (e.g. `docker`, `podman`, `LXC`/`LXD`) 🏴
- Show system time 🏴 ;
- Show number of running jobs 🏴 ;
- Prefix when `root` 🏴 ;
- Display `git` branch name 🏴 ;
  - Display `*` when `git` repository is _dirty_ ;
  - Display `≡` when `git` repository is _stashed_ ;
  - Display `⇡` when branch is _ahead_ (commits to push) ;
  - Display `⇣` when branch is _behind_ (commits to pull) ;
  - Async update when [configured with fish-async-prompt](https://github.com/pure-fish/pure/wiki/Async-git-Prompt) ;
- Update terminal title with _current folder_ and _command_ ;
- Detect when running in a container ;
- Shorten _current folder_ component in prompt and window title 🏴;
- Truncate _current folder_ component in prompt and window title 🏴;

🏴: Enabled or disabled via a [feature flag][features].

## Configuration

See [How to configure pure prompt?][configure]

## Features' Flags

See [Features and their respective options][features].

## :heart: Contribute

If you have any ideas or suggestions, we encourage you to submit a pull request. Our team will review and discuss your contribution.

Checkout our [Contribution Guide][contribution] to get familiar with our conventions and requirements.

## :man_technologist: People

- [Édouard Lopez](https://github.com/edouard-lopez) product lead ;
- [@andreiborisov](https://github.com/andreiborisov) for the [docker images][docker-images] ;
- [@jorgebucaran](https://github.com/jorgebucaran/) for [fishtape](https://github.com/jorgebucaran/fishtape) ;
- [@rafaelrinaldi](https://github.com/rafaelrinaldi) for starting the project and publishing the initial releases

## [MIT][MIT]  License

[doc]: https://pure-fish.github.io/pure/
[configure]: https://pure-fish.github.io/pure/#configuration
[features]: https://pure-fish.github.io/pure/#overview
[contribution]:https://pure-fish.github.io/pure/contributing/

[ci-link]: <https://github.com/pure-fish/pure/actions> "Github CI"
[ci-status]: https://img.shields.io/github/actions/workflow/status/pure-fish/pure/.github/workflows/ci.yml?style=flat-square

[fish-3]: <https://img.shields.io/badge/fish-v3-007EC7.svg?style=flat-square> "Support Fish 3"
[docker-images]: https://github.com/andreiborisov/docker-fish/
[MIT]: LICENSE.md

[release-version]: https://img.shields.io/github/v/tag/pure-fish/pure?label=latest%20&style=flat-square
[release-link]: https://github.com/pure-fish/pure/releases "GitHub tag (latest SemVer)"
[sponsors]: https://img.shields.io/github/sponsors/edouard-lopez?label=💰&style=flat-square "GitHub Sponsors"
[sponsor-link]: https://github.com/sponsors/edouard-lopez/ "Become a sponsor"
