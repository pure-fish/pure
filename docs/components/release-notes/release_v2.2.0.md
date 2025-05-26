title:	v2.2.0: Support dynamic content for right prompt
tag:	v2.2.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2019-11-03T15:34:36Z
published:	2019-11-03T15:46:04Z
url:	https://github.com/pure-fish/pure/releases/tag/v2.2.0
--
## ♻️ Refactor: Support dynamic content for right prompt

The `pure_right_prompt` parameter is removed in favor of native [`fish_right_prompt`](https://fishshell.com/docs/current/commands.html#fish_right_prompt) mechanism. 

### :arrow_down: Installation

    fisher add rafaelrinaldi/pure

## ⏫ Migrate Guide

### Existing Config

If you already had a configured right prompt via `pure_right_prompt` parameter, you can create the necessary new config using this command:

	echo "function fish_right_prompt; echo \"$pure_right_prompt\"; end" > $__fish_config_dir/functions/fish_right_prompt.fish

### New Config

Create `fish_right_prompt.fish` in fish config `functions/` directory manually and declare a `fish_right_prompt` function inside.
