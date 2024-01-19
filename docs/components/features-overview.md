### Overview

Fully **customizable** (colors, symbols and features):

* Excellent prompt character `❯` :
  * Change `❯` to red when previous command has failed ;
  * Start prompt with _current working directory_ 🏴 ;
  * Compact-mode (single-line prompt) 🏴 ;
* Display _current folder_  tail ;
* check for new release on start 🏴 ;
* Display _username_ and _hostname_ when in an `SSH` session ;
* Display command _duration_ when longer than `5` seconds ;
* Display `Python` _virtualenv_ when activated 🏴 ;
* Display `VI` mode and custom symbol for non-insert mode 🏴 ;
* Display `kubernetes` context and namespace 🏴 ;
* Display container indicator (e.g. `docker`, `podman`, `LXC`/`LXD`) 🏴
* Show system time 🏴 ;
* Show number of running jobs 🏴 ;
* Prefix when `root` 🏴 ;
* Display `git` branch name 🏴 ;
  * Display `*` when `git` repository is _dirty_ ;
  * Display `≡` when `git` repository is _stashed_ ;
  * Display `⇡` when branch is _ahead_ (commits to push) ;
  * Display `⇣` when branch is _behind_ (commits to pull) ;
  * Async update when [configured with fish-async-prompt](https://github.com/pure-fish/pure/wiki/Async-git-Prompt) ;
* Update terminal title with _current folder_ and _command_ ;
* Detect when running in a container ;
* Shorten _current folder_ component 🏴;

🏴: Enabled or disabled via a [feature flag](#-features-flags).
