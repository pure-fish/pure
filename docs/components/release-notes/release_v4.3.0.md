title:	v4.3.0: Add flag to disable container detection
tag:	v4.3.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2022-10-17T16:50:19Z
published:	2022-10-18T17:12:50Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.3.0
--
### :bug: Remove unwanted character

* [x]  fix/301 voidlinux container detection #302 

### :black_flag: Add flag to disable container detection

Let user disable container detection as detecting this is [not an exact science](https://stackoverflow.com/questions/57863638/).

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_enable_container_detection`**           | `true` | `false`: Do not check if run in container (e.g. `docker`, `podman`, `LXC`/`LXD`, etc.).<br/>:warning: Detection is a bit [tricky across OSes][container-detection].                                                         |

Enable feature

    ❯ set --universal pure_enable_container_detection true


### :arrow_down: Installation

    fisher install pure-fish/pure

### :clap: Thanks

* @0-st for #301 
