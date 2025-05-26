title:	v2.0.0: Fish 3.0.0 | Vim mode | Customization | Tests
tag:	v2.0.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2019-02-18T21:47:00Z
published:	2019-02-18T21:52:06Z
url:	https://github.com/pure-fish/pure/releases/tag/v2.0.0
--
With this major release we :warning: **break a lot of things** as we renamed a bunch of our variables to harmonize naming and follow our [contributing guide](https://github.com/rafaelrinaldi/pure/blob/master/CONTRIBUTING.md). 
Be sure to **read the Migration guide section carefully**.

<div align=center>
  <a href="screenshot-dark.png" target=blank><img width=350 src=https://i.imgur.com/BHxUohR.png alt="Pure with dark colorscheme"></a>
  <a href="screenshot-light.png" target=blank><img width=350 src=https://i.imgur.com/qJdonqo.png alt="Pure with light colorscheme"></a>
</div>

### Features

* [x] fish `3.0.0` support :tada:  (see #126, #127, #128) ;
* [x] More customization control (see  #103, [v1.11.0](https://github.com/rafaelrinaldi/pure/releases/tag/v1.11.0)) ;
* [x] Vim mode support (see #45) ;
* [x] Travis configuration to run against multiple fish versions (see #122) ;
* [x] Add tests _massively_ #63, #96  ;
* [x] Add a [CONTRIBUTING.md](CONTRIBUTING.md) ;
* [x] add `pure_version` variable (see [v1.12.0](https://github.com/rafaelrinaldi/pure/releases/tag/v1.12.0))
* [x] Let user customize fish_right_prompt (see #104, [v1.13.0](https://github.com/rafaelrinaldi/pure/releases/tag/v1.13.0))

### Installation

    fisher add rafaelrinaldi/pure

## Migration Guide `v1.x` to `v2.0.0`

If you **customized your `pure`** using your `~/config.fish` you will have to update it by renaming some variables and changing default value to others.

### :ambulance: Script

We provide [a migration script](https://github.com/rafaelrinaldi/pure/blob/dcc074f44f4cc7f191c35b0b9e61e32ec39d546d/tools/migration-to-2.0.0.fish) to help you with this tiedous work. However, you still might have to do some manual edit:

    tools/migration-to-2.0.0.fish [/path/to/my/config.fish]

### Variables Type Changes

#### :bomb: Fresh Session

* `_pure_fresh_session` changed from integer **to a boolean** 9f8b8a90bd

    ```diff
    -set -g _pure_fresh_session 1
    +set -g _pure_fresh_session true
    ```

#### :bomb: Beginning Prompt With Current Working Directory

* `pure_user_host_location` has been renamed `pure_prompt_begin_with_current_directory` as an **affirmative boolean statement** 731a406b1
  
    ```diff
    -_pure_set_default pure_user_host_location 0
    +_pure_set_default pure_prompt_begin_with_current_directory true
    ```

See [_conf.d/pure.fish_](https://github.com/rafaelrinaldi/pure/blob/1fabe247ce13a1cb4d3de3a219f0116f6af3bb43/conf.d/pure.fish#L44-L47) for details.

#### :bomb: Separate Prompt on Error

* `pure_separate_prompt_on_error` changed from integer **to a boolean** 74f028dcb

    ```diff
    -_pure_set_default pure_separate_prompt_on_error 0
    +_pure_set_default pure_separate_prompt_on_error false
    ```

### Variables Renaming

#### :bomb: Base Color

* rename `$pure_color_white` as `$pure_color_light`

    ```diff
    -pure_color_white
    +pure_color_light
    ```

* rename `$pure_color_yellow` as `$pure_color_warning`

    ```diff
    -pure_color_yellow
    +pure_color_warning
    ```

* rename `$pure_color_red` as `$pure_color_danger`

    ```diff
    -pure_color_red
    +pure_color_danger
    ```
* rename `$pure_color_magenta` as `$pure_color_success`

    ```diff
    -pure_color_magenta
    +pure_color_success
    ```
* rename `$pure_color_gray` as `$pure_color_mute`

    ```diff
    -pure_color_gray
    +pure_color_mute
    ```
* rename `$pure_color_cyan` as `$pure_color_info`

    ```diff
    -pure_color_cyan
    +pure_color_info
    ```
* rename `$pure_color_blue` as `$pure_color_primary`

    ```diff
    -pure_color_blue
    +pure_color_primary
    ```

#### :bomb: Prompt Colors Variables

* rename `$pure_color_symbol_error` as `$pure_color_prompt_on_error` 7de59a3

    ```diff
    -pure_color_symbol_error
    +pure_color_prompt_on_error
    ```

* rename `$pure_color_symbol_success` as `$pure_color_prompt_on_success` f94207b

    ```diff
    -pure_color_symbol_success
    +pure_color_prompt_on_success
    ```

#### :bomb: Git Feature Variables

* rename `$pure_symbol_git_arrow_up` as `$pure_symbol_git_unpushed_commits`

    ```diff
    -pure_symbol_git_arrow_up
    +pure_symbol_git_unpushed_commits
    ```

* rename `$pure_symbol_git_arrow_down` as `$pure_symbol_git_unpulled_commits`

    ```diff
    -pure_symbol_git_arrow_down
    +pure_symbol_git_unpulled_commits
    ```

* split `$pure_color_git_pending_commits` as `$pure_color_git_unpushed_commits` and `$pure_color_git_unpulled_commits`

    ```diff
    -pure_color_git_pending_commits
    +pure_color_git_unpushed_commits
    +pure_color_git_unpulled_commits
    ```

#### :bomb: Max Execution Time Feature Variables

* rename `$pure_command_max_exec_time` as `$pure_threshold_command_duration`

    ```diff
    -pure_command_max_exec_time
    +pure_threshold_command_duration
    ```

#### :bomb: Title Bar Variable

* rename `$pure_symbol_horizontal_bar` as `$pure_symbol_title_bar_separator`

    ```diff
    -pure_symbol_horizontal_bar
    +pure_symbol_title_bar_separator
    ```

#### :bomb: Beginning Of Prompt Variable

* rename `$pure_prompt_begin_with_current_directory` as `$pure_begin_prompt_with_current_directory`

    ```diff
    -pure_prompt_begin_with_current_directory
    +pure_begin_prompt_with_current_directory
    ```

#### :bomb: SSH Variable

* rename `$pure_color_ssh_host` as `$pure_color_ssh_hostname`
    ```diff
    -pure_color_ssh_host
    +pure_color_ssh_hostname
    ```

#### :bomb: Current Working Directory Variable

* rename `$pure_color_current_folder` as `$pure_color_current_directory`

    ```diff
    -pure_color_current_folder
    +pure_color_current_directory
    ```

#### Fixes

* Replace `fisherman` with `fisher` in Dockerfile #110 
