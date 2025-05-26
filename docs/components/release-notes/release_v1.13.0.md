title:	v1.13.0: Let user customize fish_right_prompt
tag:	v1.13.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2019-01-08T15:41:03Z
published:	2019-01-08T15:52:37Z
url:	https://github.com/pure-fish/pure/releases/tag/v1.13.0
--
### Feature

* let user customize their right prompt in an update-resistant way #104 

```fish
# Right Prompt variables
_pure_set_default pure_right_prompt ""
_pure_set_default pure_color_right_prompt $pure_color_normal
```

<img width="712" alt="screenshot" src="https://user-images.githubusercontent.com/1212392/50841404-efa90680-1364-11e9-871c-674f19cd75dc.png">

### Quality

* test _fish_right_prompt.fish_ 4196b445b
* test right_prompt related configuration bac5393b
