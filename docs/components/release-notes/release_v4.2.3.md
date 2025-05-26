title:	v4.2.3: Skip Linux-only methods to detect container on MacOS 
tag:	v4.2.3
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2022-10-08T05:48:00Z
published:	2022-10-08T05:51:41Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.2.3
--
## :bug: Fix: Linux-only methods to detect container on MacOS 

Issue #295 was caused by functions that expected `/proc/` to exist on the system to be executed. However, those are Linux-only approach.
So, [running them only for Linux][skip-code] declared OS (cf. `uname -s`) fixed the issue in #298 .

 ### :arrow_down: Installation
 The project has a new home, thanks to @rafaelrinaldi. It's now under pure-fish organization:

    fisher install pure-fish/pure


###  :clap: Thanks

* @Defman21 @nertzy @externl for helping the resolution
* @orf for making me aware of `fisher install pure-fish/pure@<BRANCH_NAME>`

[skip-code]: https://github.com/pure-fish/pure/pull/298/files#diff-64090762fd2ecc9ed782569b4def0e5c41e62bd548dc0c944e3bf5e540865932R10-R18
