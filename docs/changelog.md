---
toc_depth: 3
---

# Changelog

!!! note

	All notable changes to this project are documented below.
	This changelog is automatically generated from [GitHub Releases](https://github.com/pure-fish/pure/releases).

## [v4.19.0: 🥷 prompt prefix when in Fish private mode](https://github.com/pure-fish/pure/releases/tag/v4.19.0)

<small>2026-09-08</small>

### :ninja: Add prompt prefix when in Fish **private mode**

<img width="208" height="50" alt="light-pure_show_prefix_private_prompt=true" src="https://github.com/user-attachments/assets/c5636a09-4e98-4ce3-8311-25c8c1fcb0ac" />

#### Working in private mode

| Option                                  | Default | Description                                                                  |
| :-------------------------------------- | :------ | :--------------------------------------------------------------------------- |
| **`pure_show_prefix_private_prompt`**   | `false` | `true`: shows prompt prefix when running in Fish private mode (`--private`). |
| **`pure_symbol_prefix_private_prompt`** | `!`     | Prefix prompt when in private mode.                                          |

##### Preview

<table>
<tr>
 <th>
Context
 <th>
Screenshot
<tr>
 <td>
Prefix prompt symbol
 <td>
<img width="208" height="50" alt="light-pure_show_prefix_private_prompt=true" src="https://github.com/user-attachments/assets/c5636a09-4e98-4ce3-8311-25c8c1fcb0ac" />
<tr>
 <td>
Prefix prompt symbol<br>
with transient prompt enabled
 <td>
<img width="253" height="90" alt="light-pure_show_prefix_private_prompt=true,fish_transient_prompt=1" src="https://github.com/user-attachments/assets/518ca93e-cf95-4c4d-9367-57cc0835da83" />
<tr>
 <td>
Prefix prompt symbol<br>
user root user
 <td>
<img width="208" height="50" alt="light-pure_show_prefix_root_prompt=true,pure_show_prefix_private_prompt=true" src="https://github.com/user-attachments/assets/274e8c0e-5a4d-410f-8d3e-38434488a808" />
</table>
by @devansh08 in https://github.com/pure-fish/pure/pull/423


## What's Changed
* update documentation for `pure_system_time_format` by @ThatOneCalculator in https://github.com/pure-fish/pure/pull/417

## New Contributors
* @devansh08 made their first contribution in https://github.com/pure-fish/pure/pull/423

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.18.0...v4.19.0

---

## [v4.18.0: 📖 Add link to the release notes on update](https://github.com/pure-fish/pure/releases/tag/v4.18.0)

<small>2026-04-23</small>

### Add link to the release notes on update

> <img width="579" height="38" alt="Selection_525" src="https://github.com/user-attachments/assets/79196f88-9386-468d-a04c-fbddef687d9f" />

by @edouard-lopez in https://github.com/pure-fish/pure/pull/415


**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.17.0...v4.18.0

---

## [v4.17.0: 🔀 Faster git dirty check, 🕒 Support 12/24/custom time format](https://github.com/pure-fish/pure/releases/tag/v4.17.0)

<small>2026-04-21</small>

### :twisted_rightwards_arrows: Simplify git dirty check using git status

In large repositories, checking for untracked files is very slow, so `status.showUntrackedFiles=false` is typically set to improve `git status` performance.

`_pure_prompt_git_dirty` doesn't use `git status` however, but three separate `git` commands to check for staged changes, unstaged changes and untracked files. The command for untracked files is `git ls-files --others` which doesn't respect `status.showUntrackedFiles=false`.

Instead we can check for non-empty output from `git status --porcelain`, which checks all three of these things in one command and respects `status.showUntrackedFiles=false`.

This reduces `_pure_prompt_git_dirtry` runtime from 9.3s to 0.8s on our repository.

by @jesses-canva in https://github.com/pure-fish/pure/pull/410

### :clock3: Support 12/24/custom time format

Introduce `pure_show_system_time_format` variable to control time formatting following `date` format (default to `+%T`). Users can override it using [date format](https://ss64.com/bash/date.html) (cf. for [Mac](https://ss64.com/mac/date.html)) with:

    set --universal pure_show_system_time_format '+%I:%M:%S %p'

by @ThatOneCalculator in https://github.com/pure-fish/pure/pull/412

## New Contributors
* @jesses-canva made their first contribution in https://github.com/pure-fish/pure/pull/410
* @ThatOneCalculator made their first contribution in https://github.com/pure-fish/pure/pull/412

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.16.0...v4.17.0

---

## [v4.16.0: 🔍 Custom install location support](https://github.com/pure-fish/pure/releases/tag/v4.16.0)

<small>2026-03-02</small>

###  🔍 Custom install location support

Adds support for installing pure into a custom install location. As suggested in #394, a variable `$_pure_root` is added to `_pure_init.fish` to determine the install location, and all instances of `$__fish_config_path` is replaced by `$_pure_root`, so the `source` commands in `$_pure_init.fish` will work correctly regardless of where pure is installed into. This allows pure to work when installed into a custom fisher install location.

by @benedictleejh in https://github.com/pure-fish/pure/pull/397

### What's Changed
* docs/fossdem review by @edouard-lopez in https://github.com/pure-fish/pure/pull/402
* docs: fix typos and grammar across documentation by @simono in https://github.com/pure-fish/pure/pull/407
* ci: skip docs deployment on pull requests by @simono in https://github.com/pure-fish/pure/pull/408
* ci: always generate screenshots before deploying docs by @simono in https://github.com/pure-fish/pure/pull/409


### New Contributors
* @simono made their first contribution in https://github.com/pure-fish/pure/pull/407

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.15.1...v4.16.0

---

## [v4.15.1: 🐍 support `VIRTUAL_ENV_PROMPT`](https://github.com/pure-fish/pure/releases/tag/v4.15.1)

<small>2026-02-13</small>

### 🐍 Support `VIRTUAL_ENV_PROMPT` 

In addition to the already implemented `VIRTUAL_ENV` variable, many Python virtual env tools also set `VIRTUAL_ENV_PROMPT` (e.g. [virtualenv](https://virtualenv.pypa.io/en/stable/user_guide.html)). Unlike `VIRTUAL_ENV`, which is the absolute path to the virtual env directory (e.g. `/home/user/project/.venv`), `VIRTUAL_ENV_PROMPT` is just the name of the virtual env project.

This pull request implements displaying `VIRTUAL_ENV_PROMPT` when it's set and defaulting to existing `VIRTUAL_ENV` or `CONDA_DEFAULT_ENV` base names otherwise.

Thanks to @gouline works on #405

### What's Changed
* fix: support VIRTUAL_ENV_PROMPT alongside VIRTUAL_ENV by @gouline in https://github.com/pure-fish/pure/pull/405
* docs/import release notes by @edouard-lopez in https://github.com/pure-fish/pure/pull/370
* docs/fix documentation table of contents links broken 403 by @edouard-lopez in https://github.com/pure-fish/pure/pull/404

## New Contributors
* @gouline made their first contribution in https://github.com/pure-fish/pure/pull/405

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.15.0...v4.15.1

---

## [v4.15.0: Option to display exit pipe status](https://github.com/pure-fish/pure/releases/tag/v4.15.0)

<small>2026-01-07</small>

### List Exit Statuses

* feat: add option to display exit pipe status by @Maritsu :clap: in https://github.com/pure-fish/pure/pull/395

| State                                 | Preview                                                                                                                                                                                              |
| :------------------------------------ | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Enabled (list exit statuses)          | <img width="181" height="50" alt="light-pure_show_exit_status=true" src="https://github.com/user-attachments/assets/4caf36f9-0b5f-426b-900b-74327637bf74" />                                         |
| Enabled (convert statuses to signals) | <img width="181" height="50" alt="light-pure_show_exit_status=true,pure_convert_exit_status_to_signal=true" src="https://github.com/user-attachments/assets/9fd294f4-4850-474f-9f94-687492a8e0cf" /> |

| Option                                   | Default | Description                                                  |
| :--------------------------------------- | :------ | :----------------------------------------------------------- |
| **`pure_show_exit_status`**              | `false` | `true`: Show list of status codes if the last command failed |
| **`pure_convert_exit_status_to_signal`** | `false` | `true`: Convert statuses 129 and up to their signal names    |
| **`pure_symbol_exit_status_prefix`**     | `\|`    | Prefix when the last command failed                          |
| **`pure_symbol_exit_status_separator`**  | `\|`    | Separator between statuses in a pipeline                     |



### New Contributors
* @Maritsu made their first contribution in https://github.com/pure-fish/pure/pull/395

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.14.1...v4.15.0

---

## [v4.14.0: 👋 Being polite](https://github.com/pure-fish/pure/releases/tag/v4.14.0)

<small>2025-12-04</small>

### What's Changed
* feat/show version on install update by @edouard-lopez in https://github.com/pure-fish/pure/pull/390

We do our best to clean up after ourselves and provides information on the version installed or updated.

#### Plugin Fresh Install

![screenshot _pure_install](https://pure-fish.github.io/pure/assets/screenshots/light-_pure_install.png#only-light)

#### Plugin Update

![screenshot _pure_install](https://pure-fish.github.io/pure/assets/screenshots/light-_pure_update.png#only-light)



**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.13.0...v4.14.0

---

## [v4.13.0: Support Transient prompt](https://github.com/pure-fish/pure/releases/tag/v4.13.0)

<small>2025-12-03</small>

### What's Changed
* feat: add **transient prompt** support (Fish 4.1.0+) by @Copilot in https://github.com/pure-fish/pure/pull/389
* Remove `fish_greeting.fish` to stop overriding user's custom greeting by @Copilot in https://github.com/pure-fish/pure/pull/387
* docs/screenshot automation by @edouard-lopez in https://github.com/pure-fish/pure/pull/345
* ci/extract [terminal screenshot to a docker image](https://github.com/pure-fish/docker-terminal-screenshot) by @edouard-lopez in https://github.com/pure-fish/pure/pull/386

### Features

#### [:scissors: Transient Prompt](https://pure-fish.github.io/pure/#transient-prompt)

> Simplify previous prompts in scrollback history (Fish 4.1.0+)

| Option                       | Default | Description                                                              |
| :--------------------------- | :------ | :----------------------------------------------------------------------- |
| **`fish_transient_prompt`**  | -       | Fish built-in variable. Set to `1` to enable [transient prompt](https://fishshell.com/docs/4.1/prompt.html#transient-prompt).           |

Shows a simplified prompt (just the prompt symbol) for previous commands, keeping your scrollback clean while maintaining full context on the current prompt.
When enabled, Fish re-runs the prompt with `--final-rendering` before executing a command.

Transient prompt works best with single line prompt enabled:

```fish
set --universal fish_transient_prompt 1
set --universal pure_enable_single_line_prompt true
```

##### Preview

<table>
<tr style="vertical-align: top;">
 <td>Enabled<br>(simplified previous prompts, single line)
 <td>Disabled<br>(full prompts in scrollback)
<tr>
 <td><img src="https://pure-fish.github.io/pure/assets/screenshots/light-fish_transient_prompt%3D1%2Cpure_enable_single_line_prompt%3Dtrue.png#only-light" alt="screenshot fish_transient_prompt=1,pure_enable_single_line_prompt=true" style="max-width: 100%;">
 <td><img src="https://pure-fish.github.io/pure/assets/screenshots/light-fish_transient_prompt%3D0%2Cpure_enable_single_line_prompt%3Dtrue.png#only-light" alt="screenshot fish_transient_prompt=0,pure_enable_single_line_prompt=true" style="max-width: 100%;">
</table>

### Changes

#### [👋 Customizing Fish Greeting](https://pure-fish.github.io/pure/#customizing-fish-greeting)

> Since version `≥4.13.x`, `pure` does not override your `fish_greeting` function anymore, allowing you to use your own custom greeting.

To configure your Fish's greeting, edit `$__fish_config_dir/functions/fish_greeting.fish` function or the related variable:

##### Check for new release

Add the following to call _pure_check_for_new_release_ on each new shell (i.e., when a new terminal session or `tmux` tab starts):
 
```fish
function fish_greeting
    _pure_check_for_new_release
end
```
##### Void `fish_greeting` function

Voiding the _fish_greeting.fish_ function will stop printing any greeting:

```fish
function fish_greeting
    # remove content to disable greeting
end
```

##### Empty `fish_greeting` variable

Or set the greeting to an empty string to stop printing any greeting:

```fish
set --universal fish_greeting
```

#### Screenshots Automation for the Documentation

We automated the tedious task of taking screenshots of the prompt features and build the documentation. Thus, we have always-up-to-date features screenshots! 📸

<img width="972" height="280" alt="screenshot-automation-preview" src="https://github.com/user-attachments/assets/5ed5e5ab-6f50-46b8-a771-5b4d24614fd1" />

##### Dedicated project

This feature has been extracted to a dedicated repo https://github.com/pure-fish/docker-terminal-screenshot/ to allow a maximum of people to use it :sparkling_heart: 

> Pre-built Docker image with https://github.com/OmarTawfik/terminal-screenshot/pull/11 for automated terminal screenshot generation.

<img width="828" height="257" alt="image" src="https://github.com/user-attachments/assets/63ebca17-837c-4a1a-a8f6-bef42987beb1" />


### New Contributors
* @Copilot made their first contribution in https://github.com/pure-fish/pure/pull/387 IA congratulating itself :rofl: (nice help bootstrapping PR, but still need human touch)

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.12.0...v4.13.0



---

## [v4.12.0: Shows git stash, commits ahead/behind count next to indicator](https://github.com/pure-fish/pure/releases/tag/v4.12.0)

<small>2025-09-23</small>

### What's Changed
* feat: numbered git stash, commits ahead/behind indicator by @lungsin in https://github.com/pure-fish/pure/pull/382
* ci/fix nixos tests by @edouard-lopez in https://github.com/pure-fish/pure/pull/384

### :1234: Numbered git stash, commits ahead/behind indicator

```
❯ set --universal pure_show_numbered_git_indicator false # default
❯ set --universal pure_show_numbered_git_indicator true
```

Default (disabled) | Feature enabled
| --- | ---
<img width="620" height="74" alt="image" src="https://github.com/user-attachments/assets/9c40d24d-7df9-48cb-9f53-2de868443d30" /> | nothing next to stash, pull/push indicator
<img width="620" height="74" alt="image" src="https://github.com/user-attachments/assets/c4a78941-728c-47b7-8bb1-9b58cc23aa8d" /> | count of stash entries, commit ahead/behind next to indicators

### CI/Tests

* Test jobs now show fish version used ;
* update NixOS image to `2.31.2` ;
* Fix all test on NixOS due to missing package ;
* Add [AGENTS.md](https://agents.md/) file to project ;
* support pre-release version number when bumping version (used in PR tests)

### New Contributors
* @lungsin made their first Pull request contribution in https://github.com/pure-fish/pure/pull/382

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.11.4...v4.12.0

---

## [v4.11.4: Improve VS Code Shell integration and NixOS tests](https://github.com/pure-fish/pure/releases/tag/v4.11.4)

<small>2025-09-22</small>

### What's Changed
* fix(vscode): prevent vscode from adding extra line by @edouard-lopez in https://github.com/pure-fish/pure/pull/381
* docs/contributing.md by @edouard-lopez in https://github.com/pure-fish/pure/pull/374
* ci: Update `nix.Dockerfile` by @Pamplemousse in https://github.com/pure-fish/pure/pull/376

#### Use source in NixOS

We use `pure` current source code when running the tests instead of the package from Nix repository. This way, tests are relevant to what is being developed (not was is already published).

#### Improve VS Code Shell integration

> Prevent vscode from adding extra line

| Before | After
| --- | --- |
<img width="507" height="189" alt="Image" src="https://github.com/user-attachments/assets/b70e4e34-4ef3-4a7b-bfa4-8f09a14a9641" /> | <img width="507" height="189" alt="Image" src="https://github.com/user-attachments/assets/6fc5deaa-61c2-4b54-895e-015dbde5a992" /> |

### New Contributors
* @Pamplemousse made their first contribution in https://github.com/pure-fish/pure/pull/376

### :clap: Thanks
* @Perlence for raising the issue, providing insight and feedback before release

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.11.3...v4.11.4

---

## [v4.11.3: NixOS fix sourcing from vendor directory](https://github.com/pure-fish/pure/releases/tag/v4.11.3)

<small>2025-06-06</small>

### What's Changed
* fix(nixOS): use relative path resolution so it works in vendor directory too by @edouard-lopez in https://github.com/pure-fish/pure/pull/371
* docs: fix preview url by @edouard-lopez in https://github.com/pure-fish/pure/pull/367
* ci/post release on social networks by @edouard-lopez in https://github.com/pure-fish/pure/pull/372
* chore: Create FUNDING.yml by @edouard-lopez in https://github.com/pure-fish/pure/pull/366

### :clap: Thanks

* [caspervk](https://github.com/caspervk) for the NixOs insights

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.11.2...v4.11.3

---

## [v4.11.2](https://github.com/pure-fish/pure/releases/tag/v4.11.2)

<small>2025-05-20</small>

### What's Changed
* fix: add shepherd to the list of supported init programs by @jbweston in https://github.com/pure-fish/pure/pull/354

### New Contributors
* @jbweston made their first contribution in https://github.com/pure-fish/pure/pull/354

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.11.1...v4.11.2

---

## [v4.11.1](https://github.com/pure-fish/pure/releases/tag/v4.11.1)

<small>2025-05-19</small>

### What's Changed
* ci: allow manually running a workflow by @edouard-lopez in https://github.com/pure-fish/pure/pull/361
* ci: drop 3.6.3 and 3.7.0 in favour of 3.7.1 and 4.0.2 by @edouard-lopez in https://github.com/pure-fish/pure/pull/363
* fix: source _pure_prompt_new_line event handler instead of relying on autoloading by @edouard-lopez in https://github.com/pure-fish/pure/pull/357
* fix/360 fish title append an extra space in 4 0 2 by @edouard-lopez in https://github.com/pure-fish/pure/pull/365


**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.11.0...v4.11.1

---

## [v4.11.0: 📖 New Doc! ✨ AWS Profile Support and 🤖 tests on MacOS](https://github.com/pure-fish/pure/releases/tag/v4.11.0)

<small>2024-02-16</small>

### What's Changed
* :book: docs/revamp documentation and automate screenshots by @edouard-lopez in https://github.com/pure-fish/pure/pull/343
* :sparkles: feat: AWS profile prompt by @kwigley in https://github.com/pure-fish/pure/pull/346
* :robot: ci: Pass tests under macOS by @hyperupcall in https://github.com/pure-fish/pure/pull/340

#### :book:  New Documentation

- a better User eXperience (UX)
- a [dedicated site](https://pure-fish.github.io/pure/), 
- searchable content (thanks to [mkdocs](https://www.mkdocs.org/))
- screenshot of prompt with/without feature enabled (thanks to [terminal-screenshot](https://github.com/OmarTawfik/terminal-screenshot))
- a better organization for options
- linkable content you can share/bookmark

[![image](https://github.com/pure-fish/pure/assets/1212392/312759bd-302b-4282-a069-1c8d5455b669)](https://pure-fish.github.io/pure)

#### :sparkles: rAWS Profile

| Option                              | Default | Description                                                                  |
| :---------------------------------- | :------ | :--------------------------------------------------------------------------- |
| **`pure_enable_aws_profile`**        | `true`  | Show AWS profile name (based on `AWS_VAULT` or `AWS_PROFILE`).       |
| **`pure_symbol_aws_profile_prefix`** |         | Prefix when a AWS profile is activated (default: [undefined][to-set]) |

| with a AWS Vault | with a AWS Profile
| --- | ---
![image](https://github.com/pure-fish/pure/assets/1212392/dc56bd07-c5d7-4ea8-b6de-fce6d1205d3f) | ![image](https://github.com/pure-fish/pure/assets/1212392/52e18913-8d0b-40bb-b8bc-8e342f95f406) |

#### :robot: Test against MacOS in CI

We use `brew` to install Fish.

### New Contributors
* @hyperupcall made their first contribution in https://github.com/pure-fish/pure/pull/340

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.10.1...v4.11.0

---

## [v4.10.1: Add support for Nix build environment](https://github.com/pure-fish/pure/releases/tag/v4.10.1)

<small>2024-01-25</small>

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


---

## [v4.9.0: Truncate prompt current_directory and title to keep last components](https://github.com/pure-fish/pure/releases/tag/v4.9.0)

<small>2024-01-23</small>

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

---

## [v4.8.2: fix k8s context checking](https://github.com/pure-fish/pure/releases/tag/v4.8.2)

<small>2023-12-01</small>

## What's Changed
* fixed duplicate lines in readme by @n-crespo in https://github.com/pure-fish/pure/pull/333
* fix k8s context checking by @edouard-lopez in https://github.com/pure-fish/pure/pull/334
  *  Thanks to @bobsoppe #331 for the initial work

### Default when no namespace set

![image](https://github.com/pure-fish/pure/assets/1212392/b9f88252-4e35-4262-a027-dba6381249dc)



## New Contributors
* @n-crespo made their first contribution in https://github.com/pure-fish/pure/pull/333

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.8.1...v4.8.2

---

## [v4.8.1: Add color customization to kubernestes symbol](https://github.com/pure-fish/pure/releases/tag/v4.8.1)

<small>2023-09-26</small>


## What's Changed

* refactor k8s support #330 

### :art:  New config in conf.d/pure.fish

```fish
_pure_set_default pure_color_k8s_symbol pure_color_dark
```

### Usage

```fish
set --universal pure_enable_k8s true # enable the featyre
set --universal pure_color_k8s_symbol cyan # customize color
```

### Preview

![image](https://github.com/pure-fish/pure/assets/1212392/6cc3f516-af77-4a63-9d41-60ad13336996)

## :clap: Thanks

* @bobsoppe for spotting the gap and submitting the PR

---

## [v4.8.0: NixOS support](https://github.com/pure-fish/pure/releases/tag/v4.8.0)

<small>2023-08-30</small>

## What's Changed
* feat: add NixOs Dockerfile by @edouard-lopez in https://github.com/pure-fish/pure/pull/328

## NixOS Support

Some of the tests and test utils assumed they were ran by `$USER=nemo`. This is not the case in NixOS and probably other distros as well. We fixed the tests for NixOS, but there is still work to do ensure

## CI

### NixOS Job
We added a job to run the test again NixOS `2.17.0` using Fish `3.6.1` only

![image](https://github.com/pure-fish/pure/assets/1212392/a8a91f9b-9498-42a0-adbd-3b35ca4721b3)

### Dropping Versions Support

The following versions have been dropped, following our [Versions Support Strategy](https://github.com/pure-fish/pure/wiki/Versions-Support-Strategy)

```diff
- Fish: 3.0.2
- Fish: 3.1.2
- Fish: 3.2.2
- Fish: 3.3.1
```

## Mocks

We recently introduced a set of helpers functions to mock and spy system or pure's function. Here is a summary, but be sure to check the content of https://github.com/pure-fish/pure/tree/master/tests/mocks for implementation details.

### Mocking

* `_mock`: Mock a function using the mock in `tests/mocks/`
  * `function_name`: name of the method to mock
* `_mock_exit_status`: Mock a response exit status for a mock function
  * `function_name`: name of the method to mock
  * `status_code`: response to return
* `_mock_response`: Mock a response for a mock function
  * `function_name`: name of the method to mock
  * `response`: response to return
* `_clean_mock`: Clean a mock function  (warning: erase the function)
  * `function_name`: name of the method to mock

### Spying

* `_spy`: Create a spy method so, you can check it's been called with `_has_called`
  * `function_name`: name of the method to spy
* `_has_called`: check spy method has been called, i.e has written to the /tmp/$function_name.mock_calls
  * `function_name`: name of the that have been spied on
  * `function_args` # arguments to passed to the spy

### Cleaning

* `_clean_all_mocks`: Clean all mock functions created by `_mock`
* `_pure_unmock`: Restore a pure function by reloading its source
  * `function_name`: name of the method to mock
* `_clean_all_spy_calls`: Clean all spy calls created by `_spy`

### :arrow_down:  Installation

```sh
fisher update pure-fish/pure; or fisher install pure-fish/pure
```

### :clap: Thanks

* @pacien for spotting the issue, providing feedback about NixOS and his patience


**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.7.1...v4.8.0

[to-set]: https://github.com/pure-fish/pure/#paintbrush-configuration


---

## [v4.7.1](https://github.com/pure-fish/pure/releases/tag/v4.7.1)

<small>2023-08-29</small>

## What's Changed
* fix/missing blank line between prompts 293 by @edouard-lopez in https://github.com/pure-fish/pure/pull/326


**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.7.0...v4.7.1

---

## [v4.7.0: Virtualenv feature flag and customization symbol](https://github.com/pure-fish/pure/releases/tag/v4.7.0)

<small>2023-08-22</small>

## What's Changed
* feat(python): add feature flag to control virtualenv behavior by @edouard-lopez in https://github.com/pure-fish/pure/pull/325

## :snake: Add feature flag and customization symbol for Virtualenv

### Preview

> ![image](https://github.com/pure-fish/pure/assets/1212392/aff28920-790e-4072-9b7c-bf24221fde22)

### Configuration

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_symbol_virtualenv_prefix`**    |         | Prefix when a Python virtual env is activated (default: [undefined][to-set]) |
| **`pure_enable_virtualenv`**                             | `true`  | Show virtual env name (based on `VIRTUAL_ENV` or `CONDA_DEFAULT_ENV`).                                                                                              |


#### Default Behaviour: `true`

```shell
❯ set --universal pure_enable_virtualenv true
```

#### Feature Enable: `true`

```fish
❯ set --universal pure_enable_virtualenv true
❯ set --universal pure_symbol_virtualenv_prefix "🐍 "
```

Then activate a virtualenv or simulate one:
```fish
❯ set VIRTUAL_ENV /home/test/fake/project/ # simulate virtualenv
~/projects/contributions/pure master ≡
🐍 project ❯
```

> [pure_enable_virtualenv.webm](https://github.com/pure-fish/pure/assets/1212392/3c855767-596e-4576-a8e9-ef3746b93dd6)


### :arrow_down:  Installation

	fisher install pure-fish/pure

### :clap: Thanks

* @Sbozzolo for initiating the conversation #274
* @dwt for suggesting the emoji #291

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.6.4...v4.7.0

[to-set]: https://github.com/pure-fish/pure/#paintbrush-configuration


---

## [v4.6.4](https://github.com/pure-fish/pure/releases/tag/v4.6.4)

<small>2023-08-21</small>

## What's Changed
* fix/remove user and host when outside container by @edouard-lopez in https://github.com/pure-fish/pure/pull/327


**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.6.3...v4.6.4

---

## [v4.6.3](https://github.com/pure-fish/pure/releases/tag/v4.6.3)

<small>2023-08-21</small>

## What's Changed
* Refrain from printing container string matches by @erik-inkapool in https://github.com/pure-fish/pure/pull/283

## New Contributors
* @erik-inkapool made their first contribution in https://github.com/pure-fish/pure/pull/283

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.6.2...v4.6.3

---

## [v4.6.2](https://github.com/pure-fish/pure/releases/tag/v4.6.2)

<small>2023-08-21</small>

## What's Changed
* improve _pure_prompt_git_dirty #286 thanks to @spthm


**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.6.1...v4.6.2

---

## [v4.6.1](https://github.com/pure-fish/pure/releases/tag/v4.6.1)

<small>2023-08-21</small>

## What's Changed
* fix/tests by @edouard-lopez in https://github.com/pure-fish/pure/pull/324
* Add test helpers function: `_spy`, `_has_called`, `_cleanup_spy_calls`
* renaming: `setup` → `before_all`, `teardown` → `after_all`

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.6.0...v4.6.1

---

## [v4.6.0: Kubernetes context and namespace, message warn missing requirement, pull request template](https://github.com/pure-fish/pure/releases/tag/v4.6.0)

<small>2023-08-16</small>

## What's Changed
* feat/add kubernetes k8s support by @edouard-lopez in https://github.com/pure-fish/pure/pull/323
* [Pull request template][pr-template]
* **Full Changelog**: https://github.com/pure-fish/pure/compare/v4.5.0...v4.6.0

## :wheel_of_dharma: Kubernetes Context and Namespace

### Configuration

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_symbol_k8s_prefix`**           | `☸`     | Prefix when being connected to Kubernetes/K8s                       |
| **`pure_enable_k8s`**                                    | `false` | `true`: shows `kubernetes` context and namespace.                                                                                                                   |

#### Default Behaviour: `false`

```shell
❯ set --universal pure_enable_k8s false
~/projects/contributions/pure master ≡
```

#### Feature Enable: `true`

```shell
❯ set --universal pure_enable_k8s true
~/projects/contributions/pure master ≡ ☸ int-infra-eks-cluster-eu-west-3/qraft
```

## :bulb: Warning Message When Command Required by Feature is Missing

For now, this mechanism is only on the k8s feature, but that's something I would like to add to other features. 

[pure-k8s-feature.webm](https://github.com/pure-fish/pure/assets/1212392/a81bdc2f-8a18-401c-bff0-cb727f98aba7)

The detection behaviour is implemented in `_pure_check_availability` [function][code] & [tests][test] and it's used like:

```fish
_pure_check_availability <feature_name> <cmd>
```
Where `feature_name` is the feature that requires the command/function `cmd`

## Pull request template

Link to resources and how-tos to give contributors autonomy. See [.github/pull_request_template.md][pr-template] for full content.

### Preview

> ![pure-pull-request-template](https://github.com/pure-fish/pure/assets/1212392/bff97f39-cebe-42a3-9e75-f05a1cea2195)


### :arrow_down:  Installation

	fisher install pure-fish/pure

### :clap: Thanks

* @dwt for initiating the conversation #291

[pr-template]: https://github.com/pure-fish/pure/blob/596d0aa4c35355c77ad720ad52defa7dfcacd712/.github/pull_request_template.md
[code]: https://github.com/pure-fish/pure/blob/master/functions/_pure_check_availability.fish
[test]: https://github.com/pure-fish/pure/blob/master/tests/_pure_check_availability.test.fish


---

## [4.5.0: Custom window's and prompt's title shortening flag](https://github.com/pure-fish/pure/releases/tag/v4.5.0)

<small>2023-08-01</small>

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

---

## [v4.4.4: Fish 3.6.1 and fix container detection default behavior](https://github.com/pure-fish/pure/releases/tag/v4.4.4)

<small>2023-06-29</small>

## :bug: Remove `user@host` information by default

The prompt behaviour was inconsistent with the `pure_enable_container_detection` flag. The component `user@host` was shown when it was not supposed to be (cf. #319).

Now, you need to enable the feature to see the prompt when inside container:

	set --universal pure_enable_container_detection true

### :arrow_down:  Installation

	fisher install pure-fish/pure

### Thanks

@broizter WSL 1 shows user@hostname #319 

## :seedling: Fish `3.6.1` is supported

I updated the CI to test against `3.6.1` using [pure-fish/docker-fish](https://github.com/pure-fish/docker-fish/pull/7) image.


---

## [v4.4.2: Restore fish_prompt to default content after `_pure_uninstall` run #316 ](https://github.com/pure-fish/pure/releases/tag/v4.4.2)

<small>2023-06-29</small>

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

---

## [v4.4.1: Fix The path part doesn't show](https://github.com/pure-fish/pure/releases/tag/v4.4.1)

<small>2023-01-31</small>

### :bug: The path part doesn't show

When `git` is missing from the system, we [incorrectly aborted the whole prompt](https://github.com/pure-fish/pure/blob/1aca7e7a45768af2f5196daa6d37dd2a1d2bb75a/functions/_pure_prompt_first_line.fish#L6-L8), and we even had [a test case for that](https://github.com/pure-fish/pure/blob/1aca7e7a45768af2f5196daa6d37dd2a1d2bb75a/tests/_pure_prompt_first_line.test.fish#L35-L49) :laughing: 
So now, we simply skip `git`-related features when it is missing and carry on (cf. #313).

### :clap: Thanks

* @w3ntao for raising #166 

### :arrow_down: Installation

    fisher install pure-fish/pure

---

