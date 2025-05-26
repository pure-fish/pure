title:	v4.4.1: Fix The path part doesn't show
tag:	v4.4.1
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2023-01-31T21:34:18Z
published:	2023-01-31T22:52:35Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.4.1
--
### :bug: The path part doesn't show

When `git` is missing from the system, we [incorrectly aborted the whole prompt](https://github.com/pure-fish/pure/blob/1aca7e7a45768af2f5196daa6d37dd2a1d2bb75a/functions/_pure_prompt_first_line.fish#L6-L8), and we even had [a test case for that](https://github.com/pure-fish/pure/blob/1aca7e7a45768af2f5196daa6d37dd2a1d2bb75a/tests/_pure_prompt_first_line.test.fish#L35-L49) :laughing: 
So now, we simply skip `git`-related features when it is missing and carry on (cf. #313).

### :clap: Thanks

* @w3ntao for raising #166 

### :arrow_down: Installation

    fisher install pure-fish/pure
