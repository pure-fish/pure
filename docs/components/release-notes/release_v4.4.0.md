title:	📦 v4.4.0: Add SSH and container symbol customization
tag:	v4.4.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2022-12-14T20:20:58Z
published:	2022-12-14T20:27:23Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.4.0
--
> As for previous features, the customization is opt-in, and it's [up to the user to configure it](/pure-fish/pure/#paintbrush-configuration).

## 🐋 Container detection and prefix

The container detection is enabled by default, but you need to be [inside a container](https://github.com/pure-fish/pure/blob/5ec00469639a68c5cf164f3e2c55bda77d62725b/functions/_pure_is_inside_container.fish) to see its effect:

![setting container prefix](https://user-images.githubusercontent.com/1212392/207707944-14b9b032-21c6-4136-8b1a-770df642327b.gif)

### Default settings

```fish
pure_enable_container_detection true
pure_symbol_container_prefix "" # suggestion: '🐋' or '📦'
```

### Usage

The default symbol is an empty string, you will need to set what you want like:

```console
❯ set --universal pure_symbol_container_prefix '🐋'
```

## :computer: SSH detection and prefix

The SSH detection is enabled by default, but you need to be [inside a container](https://github.com/pure-fish/pure/blob/5ec00469639a68c5cf164f3e2c55bda77d62725b/functions/_pure_prompt_jobs.fish) to see its effect:
![preview-v4 4 0-ssh](https://user-images.githubusercontent.com/1212392/207710506-692e8a1e-d945-46df-af9f-4b1339b3024d.gif)


### Default settings

```fish
_pure_set_default pure_symbol_ssh_prefix "" # suggestion: 'ssh:/' or '🔗🔐🔒🌐'
```

### Usage

The default symbol is an empty string, you will need to set what you want like:

```console
❯ set --universal pure_symbol_ssh_prefix 'ssh:/'
```

### :arrow_down: Installation

    fisher install pure-fish/pure
