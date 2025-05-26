title:	v4.9.0: Truncate prompt current_directory and title to keep last components
tag:	v4.9.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2024-01-23T10:57:17Z
published:	2024-01-23T11:04:24Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.9.0
--
## What's Changed
* feat: truncate prompt current_directory and title to keep  last components by @edouard-lopez in https://github.com/pure-fish/pure/pull/337
## Config

### :computer:   Prompt shortening

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_truncate_prompt_current_directory_keeps`** | `0` | Truncate working directory path in prompt, but keeps the last to `n` components (`0` full path in current directory)             |

```
set --universal pure_truncate_prompt_current_directory_keeps 2
```
![image](https://github.com/pure-fish/pure/assets/1212392/6cff3cae-25b7-4898-99af-88b2463f2026)


### :window: Window's title shortening
| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_truncate_window_title_current_directory_keeps`** | `0` |  Truncate working directory path in window title, but keeps the last to `n` components (`0` keep full path in window title) |

```
set --universal pure_truncate_window_title_current_directory_keeps 2
```

## :clap: Thanks

* @1999masih for suggesting the idea

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.8.3...v4.9.0
