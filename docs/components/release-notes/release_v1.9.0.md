title:	v1.9.0: Prepare for fish 3.x
tag:	v1.9.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2018-12-10T00:02:26Z
published:	2018-12-10T00:15:49Z
url:	https://github.com/pure-fish/pure/releases/tag/v1.9.0
--
* :warning: require fish `≥2.4`
* #86 fixes a problem when uninstalling pure where the function pre_prompt is still defined, by @jorgebucaran 
* #89 document workaround for Oh My Fish users, by @benedictleejh
* #91 Fix compatibility with fish 3: `^` to redirect stderr is deprecated, prefer `2>`, by @faho 
