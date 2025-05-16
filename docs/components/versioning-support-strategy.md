
[We decided](https://github.com/rafaelrinaldi/pure/issues/123) to restrict our support to the **current major `Fish` version only** (currently `3.x`) as it's available to plenty of old Ubuntu releases thanks to the [official `Fish` PPA](https://launchpad.net/~fish-shell/+archive/ubuntu/release-3) and on others [distributions repositories](https://pkgs.org/search/?q=%22friendly%20interactive%20shell%22).

As of November 2020, we should:

* :x:  drop support for ~`2.5`~, ~`2.6`~  and ~`2.7.1`~ officially ;
* :heavy_check_mark: set the lowest supported version to `3.0.0` ;
* :tada: introduce support for `3.1.0` and above.

### :earth_africa: Energy footprint

To **reduce our energy footprint**, we will only test:

* versions available [on latest Ubuntu LTS, Debian and NixOS](https://repology.org/project/fish/versions) (see [availability](https://pkgs.org/download/fish)) ;
* [latest two versions of Fish](https://github.com/fish-shell/fish-shell/releases/).
