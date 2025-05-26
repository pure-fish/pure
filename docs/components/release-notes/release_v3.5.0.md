title:	v3.5.0: 1️⃣ Add single-line prompt flag
tag:	v3.5.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2021-01-07T20:24:28Z
published:	2021-01-07T20:25:08Z
url:	https://github.com/pure-fish/pure/releases/tag/v3.5.0
--
### 1️⃣ Add single-line prompt flag

Let user have a more compact prompt, where everything is show on the same line.

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_enable_single_line_prompt`**                        | `false` | `true`: Compact prompt as a single line |

### Preview

> ![feature-pure_enable_single_line_prompt](https://user-images.githubusercontent.com/1212392/103821357-4d64ac00-506e-11eb-8ba5-e35ae682c6e2.gif)

### :arrow_down: Installation

    fisher install rafaelrinaldi/pure

### :clap: Thanks

* @iamajvillalobos for suggestion the feature fixes #65
* @noaccOS for some inspiration in #217 

--- 

:warning: Tests are going crazy at the moment, should be fixed once `fishtape` `3.0` is released, and we do the switch. If you encounter any problem, revert to previous version

    fisher install rafaelrinaldi/pure@v3.4.2
