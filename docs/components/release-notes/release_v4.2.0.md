title:	v4.2.0: ⛵ Migrate to fishtape 3
tag:	v4.2.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2022-10-06T12:27:22Z
published:	2022-10-06T10:27:56Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.2.0
--

### :recycle: Migrate to fishtape 3
* [x] Tests and CI have been migrated to [fishtape](https://github.com/jorgebucaran/fishtape/) 3 #275 
* [x] supported version are `3.1.2` and `3.3.1` (I will add CI for newer in next releases)
* [x] Improve container detection method (by PID and by cgroup) 6fbf48369548

### :arrow_down:  Installation

The project has a new home, thanks to @rafaelrinaldi. It's now under pure-fish organization:

    fisher install pure-fish/pure
