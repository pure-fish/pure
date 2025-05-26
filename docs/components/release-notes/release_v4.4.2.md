title:	v4.4.2: Restore fish_prompt to default content after `_pure_uninstall` run #316 
tag:	v4.4.2
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2023-02-01T21:58:35Z
published:	2023-06-29T11:50:58Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.4.2
--
### :bug: Restore fish_prompt to default content after `_pure_uninstall` run

pure-related variables were erased, but the `fish_prompt` file was still calling `pure` functions and throwing a lot of errors. 

To mitigate this, we replace `fish_prompt.fish` from the user (`$__fish_config_dir`) by the default one (`__fish_data_dir`)


### :clap: Thanks

* @andreysoktoev for raising #314 

### :arrow_down: Installation

    fisher install pure-fish/pure

## What's Changed
* fix: restore fish_prompt to default content after _pure_uninstall run by @edouard-lopez in https://github.com/pure-fish/pure/pull/316


**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.4.1...v4.4.2
