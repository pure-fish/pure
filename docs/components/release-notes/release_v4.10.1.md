title:	v4.10.1: Add support for Nix build environment
tag:	v4.10.1
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2024-01-25T15:19:07Z
published:	2024-01-25T15:51:16Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.10.1
--
## What's Changed
* Add support for Nix build environment by @m15a in https://github.com/pure-fish/pure/pull/338

### Nix  develop Shell activation

| Option                               | Default           | Description                                                               |
| :----------------------------------- | :---------------- | :------------------------------------------------------------------------ |
| **`pure_enable_nixdevshell`**        | `false`           | Indicate if a `nix develop` shell is activated (based on `IN_NIX_SHELL`). |
| **`pure_symbol_nixdevshell_prefix`** | `❄️`               | otherwise [nerdfonts](https://www.nerdfonts.com/): '󱄅' or ''             |
| **`pure_color_nixdevshell_prefix`**  | `pure_color_info` | prefix color                                                              |
| **`pure_color_nixdevshell_symbol`**  | `pure_color_mute` | symbol color                                                              |

#### Usage

```
set --universal pure_enable_nixdevshell true
```

## New Contributors
* @m15a made their first contribution in https://github.com/pure-fish/pure/pull/338

* **Full Changelog**: https://github.com/pure-fish/pure/compare/v4.9.0...v4.10.1
