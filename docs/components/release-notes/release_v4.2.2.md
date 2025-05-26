title:	v4.2.2: Fix MacOS container detection #295
tag:	v4.2.2
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2022-10-06T14:07:07Z
published:	2022-10-06T14:12:50Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.2.2
--
### Fix MacOS container detection

Detecting if we run inside a container or a bare OS require hacks specific to OS. The `_pure_detect_container_by_pid_method` isn't compatible with MacOS, as it's based on `/proc/` contains.

* [x] warning: An error occurred while redirecting file '/proc/1/cgroup' #295 

### :arrow_down:  Installation

The project has a new home, thanks to @rafaelrinaldi. It's now under pure-fish organization:

    fisher install pure-fish/pure

### :clap: Thanks

* @Defman21 for spotting the issue
