<!-- markdownlint-disable MD041 -->
### Overview

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

[async]: https://github.com/pure-fish/pure/wiki/Async-git-Prompt
<!-- markdownlint-disable MD051 -->
[check-for-new-release]: #check-for-new-release
[container-detection-docker]: #container-detection-docker
[current-working-directory]: #current-working-directory
[git]: #git
[jobs]: #jobs
[kubernetes]: #kubernetes
[nix-os]: #nix-os
[prompt-symbol]: #prompt-symbol
[python-virtualenv]: #python-virtualenv
[aws-profile]: #aws-profile
[separate-error-symbol]: #separate-error-symbol
[single-line-prompt]: #single-line-prompt
[ssh-session]: #ssh-session
[time-duration]: #time-duration
[title]: #title
[vi-mode]: #vi-mode
[working-as-root]: #working-as-root
<!-- markdownlint-enable MD051 -->
