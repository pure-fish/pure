## :+1: Work inside a Docker

!!! info

    We use [`docker`](https://docs.docker.com/install/) to isolate from our working environment.

Specify the [`FISH_VERSION`][fish-releases] you want, and the `CMD` executed by the container:

    make build-pure-on FISH_VERSION={{ pure.fish_version }}
    make dev-pure-on FISH_VERSION={{ pure.fish_version }} CMD="fishtape tests/*.test.fish"

!!! tip "Working with NixOS"

    We have targets for `NixOS` called `nix-build-pure-on` and `nix-dev-pure-on`:

    ```sh
    ❯ make build-pure-on-nix dev-pure-on-nix FISH_VERSION={{ pure.fish_version }}
    ```

## Code Conventions

### Be Fishy

Use the idiomatic [`test` instead of `[`](https://fishshell.com/docs/current/commands.html#test) brackets (as recommended by the documentation).

### Be Explicit

* Use **long form options**, _e.g._ `set --local`, as they are more explicit over cryptic 1-letter form.

    ```diff
    -set -l threshold 0 # in seconds
    +set --local threshold 0 # in seconds
    ```

* Use **proxy variable to explicit** your intention, e.g. use `last_exit_code` instead of `$argv[-1]`.

    ```diff
    -set --local pure_symbol (_pure_prompt_symbol $argv[-1]) # Use last exit code only
    +set --local last_exit_code $argv[-1]
    +set --local pure_symbol (_pure_prompt_symbol $last_exit_code)
    ```

### Naming Public Item

> Namespace your item with the prefix `pure_`.

* Variable: `pure_my_variable`
* Function: `pure_my_public_function`
* Filename: `pure_my_public_file.fish`
* Test file: `pure_my_public_file.test.fish`

### Naming Private Item

> Namespace your item with the prefix `_pure_` (begin with a single underscore).

* Variable: `_pure_my_variable`
* Function: `_pure_my_private_function`
* Filename: `_pure_my_private_file.fish`
* Test file: `_pure_my_private_file.test.fish`

### Local and Tools

> No need to use namespace when your variable is declared locally (`set --local`) or your file/test file is related to tooling (_installer.fish_, testing package managers install).

* Filename: `my_tool.fish`
* Test file: `my_tool.test.fish`

### Global Variable

* Public settings' default values are placed in [_conf.d/pure.fish_](conf.d/pure.fish)
* Private settings and anything else `pure` needs to do on init are placed in [_conf.d/__pure_init.fish_](conf.d/_pure_init.fish).

### Color's Variables

> Base colors should follow `$pure_color_<meaning>` pattern (cf. [bootstrap naming](https://getbootstrap.com/docs/4.1/utilities/colors/)).

#### Example

```fish
$pure_color_info     # cyan
$pure_color_success  # green
$pure_color_warning  # yellow
$pure_color_danger   # red
$pure_color_light
$pure_color_dark
$pure_color_muted    # gray
```

### Feature Design

Each feature should have:

* [ ] Documentation
  * [ ] entry in the [README's table of contents][readme] ;
  * [ ] entry in the [doc feature overview][feature-overview] ;
  * [ ] a section detailing configuration and behavior in [doc feature list][feature-list] ;
  * [ ] [screenshot generation][screenshot] for the different states of the feature.
* [ ] Configurable variables to control behavior and rendering:
    * [ ] a flag variable to enable/disable it, _e.g._ `$pure_enable_<feature>` ;
    * [ ] a prefix symbol variable to allow customization, _e.g._ `$pure_symbol_<feature>` ;
    * [ ] a color variable to allow customization, _e.g._ `$pure_color_<feature>` ;
* [ ] Clean and tested implementation:
  * [ ] a function file to encapsulate its logic, _e.g._ `functions/_pure_<feature>.fish` ;
  * [ ] a test file to encapsulate its tests, _e.g._ `tests/_pure_<feature>.test.fish` ;

### Feature's Variables

> Each feature should have a dedicated variables to allow customization.
> Feature's variables (flag, symbol, color) should use `$pure_<type>_<feature>` naming pattern:
>
> | Role   | Name pattern             |
> | :----- | :----------------------- |
> | flag   | `$pure_<verb>_<feature>` |
> | color  | `$pure_color_<feature>`  |
> | symbol | `$pure_symbol_<feature>` |

#### Example

```fish
$pure_enable_git_status
```

```fish
$pure_symbol_git_unpushed_commits
```

```fish
$pure_color_git_unpulled_commits
```

### Feature Flag's Variable

> Name should follow `$pure_<verb>_<feature>` pattern, where:
>
  > * `verb` describe the action triggered by the feature (_i.e._ `separate`, `begin`, `show`, etc.) ;
  > * `feature` describe the _what_ of the feature (_i.e._ `prompt_on_error`, `with_current_directory`, `git_status`, etc.).
> Value should be **a boolean**.
  
#### Example

```fish
$pure_begin_prompt_with_current_directory = true
```

```fish
$pure_enable_git_async = false
```

### Avoid abbreviation

> Use complete word over abbreviation.

#### Example

```fish
$pure_threshold_command_duration
```

### Posting on social media

There is a manual workflow to post on social media.

[fish-releases]: https://github.com/fish-shell/fish-shell/releases
[readme]: https://github.com/pure-fish/pure/blob/master/README.md
[feature-overview]: https://github.com/pure-fish/pure/blob/master/docs/components/features-overview.md
[feature-list]: https://github.com/pure-fish/pure/blob/master/docs/components/features-list.md
[screenshot]: https://github.com/pure-fish/pure/blob/master/tools/screenshot.fish
