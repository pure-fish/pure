title:	v3.0.0: ⚠️ Drop support for Fish 2.x
tag:	v3.0.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2020-11-30T13:39:19Z
published:	2020-11-28T22:28:05Z
url:	https://github.com/pure-fish/pure/releases/tag/v3.0.0
--
### :warning: Drop support for Fish`2.x`

Nothing fancy here, simply **dropping support for Fish `2.x`** as discussed in #123 and documented in [Versions Support Strategy](https://github.com/rafaelrinaldi/pure/wiki/Versions-Support-Strategy/):

> [We decided](https://github.com/rafaelrinaldi/pure/issues/123) to restrict our support to the **current major `Fish` version only** (currently `3.x`) as it's available to plenty of old Ubuntu releases thanks to the [official `Fish` PPA](https://launchpad.net/~fish-shell/+archive/ubuntu/release-3). 
> 
> As of November 2020, we should:
> * :x:  drop support for ~`2.5`~, ~`2.6`~  and ~`2.7.1`~ officially ;
> * :heavy_check_mark: set the lowest supported version to `3.0.0` ;
> * :tada: introduce support for `3.1.0` and above.

### :earth_africa: Energy footprint <sup>[1][1], [2][2], [3][3], [4][4]</sup>

In order to **reduce our energy footprint** we will test only the [versions provided by the official PPA](https://launchpad.net/~fish-shell/+archive/ubuntu/release-3).

### :arrow_down: Installation

    fisher install rafaelrinaldi/pure

[4]: https://www.independent.co.uk/environment/global-warming-data-centres-consume-three-times-much-energy-next-decade-experts-warn-a6830086.html
[3]: https://www.networkworld.com/article/3531316/data-center-power-consumption-holds-steady.html
[2]: https://www.comsoc.org/publications/tcn/2019-nov/energy-efficiency-data-centers
[1]: https://davidmytton.blog/how-much-energy-do-data-centers-use/
