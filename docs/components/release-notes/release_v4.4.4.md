title:	v4.4.4: Fish 3.6.1 and fix container detection default behavior
tag:	v4.4.4
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2023-06-29T11:53:05Z
published:	2023-06-29T12:01:33Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.4.4
--
## :bug: Remove `user@host` information by default

The prompt behaviour was inconsistent with the `pure_enable_container_detection` flag. The component `user@host` was shown when it was not supposed to be (cf. #319).

Now, you need to enable the feature to see the prompt when inside container:

	set --universal pure_enable_container_detection true

### :arrow_down:  Installation

	fisher install pure-fish/pure

### Thanks

@broizter WSL 1 shows user@hostname #319 

## :seedling: Fish `3.6.1` is supported

I updated the CI to test against `3.6.1` using [pure-fish/docker-fish](https://github.com/pure-fish/docker-fish/pull/7) image.
