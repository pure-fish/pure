title:	v2.4.0: Add option to show number of jobs in prompt 
tag:	v2.4.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2019-11-22T10:59:02Z
published:	2019-11-22T11:07:05Z
url:	https://github.com/pure-fish/pure/releases/tag/v2.4.0
--
## 🛠 Show number of jobs in prompt 

The feature is disabled by default and **can be enabled by adding** in the user's `config.fish` file:
```fish
set pure_show_jobs true
```

Additionally, the default color is `normal` to match the [zsh example](https://github.com/sindresorhus/pure/wiki#show-number-of-jobs-in-prompt). This is also configurable.

This is a port of a [zsh-version feature](https://github.com/sindresorhus/pure/wiki/Customizations,-hacks-and-tweaks#show-number-of-jobs-in-prompt).

### :arrow_down: Installation

    fisher add rafaelrinaldi/pure

### :clap: Thanks

* @gpanders
