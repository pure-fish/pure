title:	v2.3.0: Option to disable Git info
tag:	v2.3.0
draft:	false
prerelease:	false
author:	andreiborisov
created:	2019-11-03T17:45:45Z
published:	2019-11-03T17:54:32Z
url:	https://github.com/pure-fish/pure/releases/tag/v2.3.0
--
## 🛠 New customizations

### Disable Git info

Now you have an option to disable Git info in the prompt with the `pure_enable_git` parameter. Just set it to `false` in your `config.fish` as usual if you have performance problems in big repositories.

This is a temporary workaround until we'll add Git async support in `v3.0.0`. 

### :arrow_down: Installation

    fisher add rafaelrinaldi/pure

### :clap: Thanks

* @gpanders
