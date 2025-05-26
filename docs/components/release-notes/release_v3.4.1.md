title:	v3.4.1: 🚀 Prefix prompt when logged in as root
tag:	v3.4.1
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2020-12-26T23:49:00Z
published:	2020-12-27T00:01:29Z
url:	https://github.com/pure-fish/pure/releases/tag/v3.4.1
--
### :rocket: Add support for showing subsecond in command duration

Add a flag to prefix prompt when logged in as root (with a customizable symbol).

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_show_prefix_root_prompt`**             | `false` | `true`: shows prompt prefix when logged in as `root`.                                           |
| **`pure_symbol_prefix_root_prompt`**   | `#`     | Prefix prompt when logged in as `root`               |
| **`pure_color_prefix_root_prompt`** | `pure_color_danger` |

#### Preview

> ![prefix_root_prompt](https://user-images.githubusercontent.com/1212392/103161205-91d68900-47de-11eb-9b6f-5533c97f3595.gif)

### :arrow_down: Installation

    fisher install rafaelrinaldi/pure
