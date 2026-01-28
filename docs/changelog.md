---
toc_depth: 3
---

# Changelog

!!! note

	All notable changes to this project are documented below.
	This changelog is automatically generated from [GitHub Releases](https://github.com/pure-fish/pure/releases).

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

## [📦 v4.4.0: Add SSH and container symbol customization](https://github.com/pure-fish/pure/releases/tag/v4.4.0)

<small>2022-12-14</small>

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

---

## [v4.3.1: Fix SSH prompt](https://github.com/pure-fish/pure/releases/tag/v4.3.1)

<small>2022-10-18</small>

### :bug: Remove unwanted character

* [x]  fix(prompt): remove unwanted characters in my prompt #305 

### :arrow_down: Installation

    fisher install pure-fish/pure

### :clap: Thanks

* @patricklewis for raising the #305

---

## [v4.3.0: Add flag to disable container detection](https://github.com/pure-fish/pure/releases/tag/v4.3.0)

<small>2022-10-18</small>

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

---

## [v4.2.3: Skip Linux-only methods to detect container on MacOS ](https://github.com/pure-fish/pure/releases/tag/v4.2.3)

<small>2022-10-08</small>

## :bug: Fix: Linux-only methods to detect container on MacOS 

Issue #295 was caused by functions that expected `/proc/` to exist on the system to be executed. However, those are Linux-only approach.
So, [running them only for Linux][skip-code] declared OS (cf. `uname -s`) fixed the issue in #298 .

 ### :arrow_down: Installation
 The project has a new home, thanks to @rafaelrinaldi. It's now under pure-fish organization:

    fisher install pure-fish/pure


###  :clap: Thanks

* @Defman21 @nertzy @externl for helping the resolution
* @orf for making me aware of `fisher install pure-fish/pure@<BRANCH_NAME>`

[skip-code]: https://github.com/pure-fish/pure/pull/298/files#diff-64090762fd2ecc9ed782569b4def0e5c41e62bd548dc0c944e3bf5e540865932R10-R18


---

## [v4.2.2: Fix MacOS container detection #295](https://github.com/pure-fish/pure/releases/tag/v4.2.2)

<small>2022-10-06</small>

### Fix MacOS container detection

Detecting if we run inside a container or a bare OS require hacks specific to OS. The `_pure_detect_container_by_pid_method` isn't compatible with MacOS, as it's based on `/proc/` contains.

* [x] warning: An error occurred while redirecting file '/proc/1/cgroup' #295 

### :arrow_down:  Installation

The project has a new home, thanks to @rafaelrinaldi. It's now under pure-fish organization:

    fisher install pure-fish/pure

### :clap: Thanks

* @Defman21 for spotting the issue


---

