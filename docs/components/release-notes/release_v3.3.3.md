title:	v3.3.3: 🐛 Fix sourcing error when installing & ⚠ Fisher 4
tag:	v3.3.3
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2020-12-16T00:37:29Z
published:	2020-12-16T00:49:29Z
url:	https://github.com/pure-fish/pure/releases/tag/v3.3.3
--
### 🐛 Fix sourcing error when installing

Path to uninstall handler was relative to current working directory, using `$__fish_config_dir` fix the issue.

### :warning: Fisher `≥4`

Test are written assuming Fisher `≥4` is installed on user's machine. If that's not the case, please [update to `v4`](https://github.com/jorgebucaran/fisher).

### :arrow_down: Installation

    fisher install rafaelrinaldi/pure

### :clap: Thanks

* @externl for reporting the issue #245
* @anthonyjclark for pointing the right commit

