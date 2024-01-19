## :+1: Work inside a Docker

!!! info

    We use [`docker`](https://docs.docker.com/install/) to isolate from our working environment.

Specify the [`FISH_VERSION`][fish-releases] you want, and the `CMD` executed by the container:

    make build-pure-on FISH_VERSION=3.3.1
    make dev-pure-on FISH_VERSION=3.3.1 CMD="fishtape tests/*.test.fish"

## Code Conventions

### Be Fishy

Use the idiomatic [`test` instead of `[`](httpsc://fishshell.com/docs/current/commands.html#test) brackets (as recommended by the documentation).

### Be Explicit

Use **long form options**, _e.g._ `set --local`, as they are more explicit over cryptic 1-letter form.

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

> No need to use namespace when your variable variable is declare locally (`set --local`) or your file/test file is related to tooling (_installer.fish_, testing package managers install).

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
  > * `feature` descibre the _what_ of the feature (_i.e._ `prompt_on_error`, `with_current_directory`, `git_status`, etc.).
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

[fish-releases]: https://github.com/fish-shell/fish-shell/releases
