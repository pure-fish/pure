title:	v2.5.0: Color names in config variables and more options
tag:	v2.5.0
draft:	false
prerelease:	false
author:	andreiborisov
created:	2019-12-25T19:33:14Z
published:	2019-12-25T19:47:52Z
url:	https://github.com/pure-fish/pure/releases/tag/v2.5.0
--
### 🦄 User-friendly color names in config variables

* Set color variables with user-friendly names like `blue`, `magenta` or hex colors (`FF931C`, etc.).
* Inherit feature colors from base colors or even your own custom color variables with instant reloading.
* Use additional appearance options like `--bold`, `--background black`, etc.

### 🗑 Deprication

Setting color variables using control sequences like so:
```
set pure_color_success (set_color green)
```
is considered to be deprecated and will be removed in the `v3.0.0`. We plan to provide a migration script for this.

### :arrow_down: Installation

    fisher add rafaelrinaldi/pure
