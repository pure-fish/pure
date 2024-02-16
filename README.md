<!-- markdownlint-disable MD041 -->
<div align="center">

<img src="https://user-images.githubusercontent.com/1212392/262604075-db5d0ad2-a7ed-4a62-a1cc-ec677cf76351.png" width="61.8%" alt="Pure.fish logo"/><br>

[![ci-status]][ci-link] ![fish-3] [![release-version]][release-link] [![sponsors]][sponsor-link] <!-- 0 width spaces on this line -->

</div>

# _Pure_  `❯❮❯`

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

* [Excellent prompt character `❯` 🛠][prompt-symbol]:

    * [Change `❯` to red when previous command has failed 🛠][separate-error-symbol] ;
    * [Start prompt with _current working directory_ 🏴][current-working-directory] ;
    * [Compact-mode (single-line prompt) 🏴][single-line-prompt] ;
  
* [Check for new release on start 🏴🐌][check-for-new-release] ;
* [Display _username_ and _hostname_ when in an `SSH` session 🛠][ssh-session] ;
* [Display command _duration_ when longer than `5` seconds 🛠][time-duration] ;
* [Display `Python` _virtualenv_ when activated 🏴🛠][python-virtualenv] ;
* [Display `AWS` profile when set 🏴🛠][aws-profile] ;
* [Display `VI` mode and custom symbol for non-insert mode 🏴🛠][vi-mode] ;
* [Display `kubernetes` context and namespace 🏴🛠][kubernetes] ;
* [Detect when running in a container (e.g. `docker`, `podman`, `LXC`/`LXD`) 🏴🛠][container-detection-docker]
* [Indicate if a `nix develop` shell is activated 🏴🛠][nix-os].
* [Show system time 🏴][time-duration] ;
* [Show number of running jobs 🏴][jobs] ;
* [Prefix when `root` 🏴🛠][working-as-root] ;
* [Display `git` branch name 🏴🛠][git] ;
  
    * Display `*` when `git` repository is _dirty_ ;
    * Display `≡` when `git` repository is _stashed_ ;
    * Display `⇡` when branch is _ahead_ (commits to push) ;
    * Display `⇣` when branch is _behind_ (commits to pull) ;
    * [Async update when configured with fish-async-prompt][async] ;

* [Update terminal title with _current folder_ and _command_ 🛠][title] ;
* [Shorten or truncate _current folder_ component 🏴🛠][current-working-directory] ;
* and more…

🏴 means it's controlled by a feature flag, 🛠 mean it's configurable.

## Configuration

See [How to configure pure prompt?][configure]

## Features' Flags

See [Features and their respective options][features].

## :heart: Contribute

If you have any ideas or suggestions, we encourage you to submit a pull request. Our team will review and discuss your contribution.

Checkout our [Contribution Guide][contribution] to get familiar with our conventions and requirements.

## :man_technologist: People

* [Édouard Lopez](https://github.com/edouard-lopez) product lead ;
* [@andreiborisov](https://github.com/andreiborisov) for the [docker images][docker-images] ;
* [@jorgebucaran](https://github.com/jorgebucaran/) for [fishtape](https://github.com/jorgebucaran/fishtape) ;
* [@rafaelrinaldi](https://github.com/rafaelrinaldi) for starting the project and publishing the initial releases

## [MIT][MIT]  License

## Ports

* Original [sindresorhus/pure](https://github.com/sindresorhus/pure) Zsh implementation ;
* :fish: [pure-fish/pure](https://github.com/pure-fish/pure/) Fish implementation (features rich) ;
* :snake: [edouard-lopez/pure.py](https://github.com/edouard-lopez/pure.py/) Python implementation  (partial features) ;
* :goat: [edouard-lopez/pure.go](https://github.com/edouard-lopez/pure.go/) Golang implementation  (partial features) ;
* :gear: [xcambar/purs](https://github.com/xcambar/purs) Rust implementation ;
* :window: [nickcox/pure-pwsh](https://github.com/nickcox/pure-pwsh/) PowerShell implementation.
* :shell: [krashikiworks/pure-prompt-bash](https://github.com/krashikiworks/pure-prompt-bash) Bash implementation.


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

[async]: https://github.com/pure-fish/pure/wiki/Async-git-Prompt
[check-for-new-release]: https://pure-fish.github.io/pure/#check-for-new-release
[container-detection-docker]: https://pure-fish.github.io/pure/#container-detection-docker
[current-working-directory]: https://pure-fish.github.io/pure/#current-working-directory
[git]: https://pure-fish.github.io/pure/#git
[jobs]: https://pure-fish.github.io/pure/#jobs
[kubernetes]: https://pure-fish.github.io/pure/#kubernetes
[nix-os]: https://pure-fish.github.io/pure/#nix-os
[prompt-symbol]: https://pure-fish.github.io/pure/#prompt-symbol
[python-virtualenv]: https://pure-fish.github.io/pure/#python-virtualenv
[aws-profile]: https://pure-fish.github.io/pure/#aws-profile
[separate-error-symbol]: https://pure-fish.github.io/pure/#separate-error-symbol
[single-line-prompt]: https://pure-fish.github.io/pure/#single-line-prompt
[ssh-session]: https://pure-fish.github.io/pure/#ssh-session
[time-duration]: https://pure-fish.github.io/pure/#time-duration
[title]: https://pure-fish.github.io/pure/#title
[vi-mode]: https://pure-fish.github.io/pure/#vi-mode
[working-as-root]: https://pure-fish.github.io/pure/#working-as-root
