title:	v3.4.2: 🐛 Fix `id: illegal option --` on MacOS
tag:	v3.4.2
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2020-12-28T14:50:23Z
published:	2020-12-28T15:20:32Z
url:	https://github.com/pure-fish/pure/releases/tag/v3.4.2
--
### 🐛 Fix `id: illegal option --` on MacOS

[Linux and MacOS commands differ](https://stackoverflow.com/a/9805125/802365) in the options they provided, the former often providing extensions while the latter restrict itself to `POSIX`. We fallback to POSIX for `id`, `date`, `wc` and `rm` commands.

### Run Tests Against MacOS

I also started to extend our Github workflow so the CI run tests against MacOS.

### :arrow_down: Installation

    fisher install rafaelrinaldi/pure

### :clap: Thanks

* @nicktfried and @sgade for raising the issue #258 #260 
