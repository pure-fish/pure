title:	v2.1.4: fix test for OMF install method
tag:	v2.1.4
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2019-04-02T18:34:39Z
published:	2019-04-11T19:41:36Z
url:	https://github.com/pure-fish/pure/releases/tag/v2.1.4
--
### :bug: Fix
* correct output for pure::backup_existing_theme
* link `pure` configuration and functions to `$FISH_CONFIG_DIR/` during manual install
* rename all methods in `tests/pure_tools_installer.test.fish` to follow [our naming convention](https://github.com/rafaelrinaldi/pure/blob/master/CONTRIBUTING.md#code-conventions-for-pure)

### :arrow_down: Installation

    fisher add rafaelrinaldi/pure
