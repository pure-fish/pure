<!-- markdownlint-disable MD041 -->
### Overview

Fully **customizable** (colors, symbols and features):

* [Excellent prompt character `❯` 🛠][prompt-symbol]:

    * [Change `❯` to red when previous command has failed 🛠][separate-error-symbol] ;
    * [Start prompt with _current working directory_ 🏴][current-working-directory] ;
    * [Compact-mode (single-line prompt) 🏴][single-line-prompt] ;
    * [List exit statuses if the last command failed 🏴][list-exit-statuses] ;
  
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
* [Transient prompt mode simplifies previous prompts 🏴][transient-prompt] ;
* [Show number of running jobs 🏴][jobs] ;
* [Prefix when `root` 🏴🛠][working-as-root] ;
* [Prefix in private mode 🏴🛠][working-in-private-mode] ;
* [Display `git` branch name 🏴🛠][git] ;

    * Display `*` when `git` repository is _dirty_ ;
    * Display `≡` when `git` repository is _stashed_ ;
    * Display `⇡` when branch is _ahead_ (commits to push) ;
    * Display `⇣` when branch is _behind_ (commits to pull) ;
    * Display the number of stashes, ahead and behind commits (e.g. `≡3 ⇡5 ⇣2`) ;
    * [Async update when configured with fish-async-prompt][async] ;

* [Update terminal title with _current folder_ and _command_ 🛠][title] ;
* [Shorten or truncate _current folder_ component 🏴🛠][current-working-directory] ;
* and more…

🏴 means it's controlled by a feature flag, 🛠 means it's configurable.

[async]: https://github.com/pure-fish/pure/wiki/Async-git-Prompt
<!-- markdownlint-disable MD051 -->
[check-for-new-release]: ./doc/#check-for-new-release
[container-detection-docker]: ./doc/#container-detection-docker
[current-working-directory]: ./doc/#current-working-directory
[git]: ./doc/#git
[jobs]: ./doc/#jobs
[kubernetes]: ./doc/#kubernetes
[list-exit-statuses]: ./doc/#list-exit-statuses
[nix-os]: ./doc/#nix-os
[prompt-symbol]: ./doc/#prompt-symbol
[python-virtualenv]: ./doc/#python-virtualenv
[aws-profile]: ./doc/#aws-profile
[separate-error-symbol]: ./doc/#separate-error-symbol
[single-line-prompt]: ./doc/#single-line-prompt
[ssh-session]: ./doc/#ssh-session
[time-duration]: ./doc/#time-duration
[transient-prompt]: #transient-prompt
[title]: ./doc/#title
[vi-mode]: ./doc/#vi-mode
[working-as-root]: ./doc/#working-as-root
<!-- markdownlint-enable MD051 -->
