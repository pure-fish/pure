title:	v2.1.6: Handle double dash when measuring string length
tag:	v2.1.6
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2019-07-01T08:23:01Z
published:	2019-07-01T08:27:54Z
url:	https://github.com/pure-fish/pure/releases/tag/v2.1.6
--
### :bug: Fix

* prevent `_pure_string_width` to fail when containing double dash:
  * fix Handle virtualenvs that look like flags #177 

### :arrow_down: Installation

    fisher add rafaelrinaldi/pure
