title:	v3.3.5: 🐛 Fix source error when installing with fisher
tag:	v3.3.5
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2020-12-21T07:56:37Z
published:	2020-12-21T07:57:35Z
url:	https://github.com/pure-fish/pure/releases/tag/v3.3.5
--
### 🐛 Fix source error when installing with fisher

`Pure` was assuming that it was going to be installed in `~/.config/fish` directory, but that's not always the case (cf. #245 #250).

### :arrow_down: Installation

    fisher install rafaelrinaldi/pure

### :clap: Thanks

* @mattmc3 for the PR #251 
