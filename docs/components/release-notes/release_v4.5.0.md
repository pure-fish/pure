title:	4.5.0: Custom window's and prompt's title shortening flag
tag:	v4.5.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2023-08-01T10:43:22Z
published:	2023-08-01T11:04:54Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.5.0
--
## `fish_title`: add setting to configure pwd dir length

Add new `pure_title_dir_length` setting (default to `0`) to configure the `pwd` dir length. 0 means complete directory name.

### :computer:   Prompt shortening

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_shorten_prompt_current_directory_length`** | `0` | Shorten every prompt path component but the last to X characters (0 do not shorten)             |

#### No shortening with `0`
```shell
❯ set --universal --export pure_shorten_prompt_current_directory_length 0
~/projects/contributions/pure master ≡ ⇡
```

#### Custom shortening
```shell
❯ set --universal --export pure_shorten_prompt_current_directory_length 1
~/p/c/pure master ≡ ⇡
```

```shell
❯ set --universal --export pure_shorten_prompt_current_directory_length 2
~/pr/co/pure master ≡ ⇡
```


### :window: Window's title shortening

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_shorten_window_title_current_directory_length`** | `0` | Shorten every window title path component but the last to X characters (0 do not shorten) |

#### No shortening with `0`
```shell
❯ set --universal --export pure_shorten_window_title_current_directory_length 0
```
![image](https://github.com/pure-fish/pure/assets/1212392/7cc22e75-35aa-44a4-830a-2f08adcf0514)


#### Custom shortening
```shell
❯ set --universal --export pure_shorten_window_title_current_directory_length 1
```
![image](https://github.com/pure-fish/pure/assets/1212392/c916695b-b905-48b3-9820-40ffcb12a310)


### :arrow_down:  Installation

	fisher install pure-fish/pure

### :clap: Thanks

* @ovv for the PR #307
