### Customizing Fish Greeting

!!! info

    Pure does not override your `fish_greeting` function, allowing you to use your own custom greeting.

To **suppress the default Fish greeting**, create a `fish_greeting` function in `~/.config/fish/functions/fish_greeting.fish`:

```fish
function fish_greeting
    # Optionally add Pure's release checker:
    # _pure_check_for_new_release
end
```

Or set the greeting to an empty string:

```fish
set -U fish_greeting
```

### Slowness: try Async `git` Prompt

!!! info

    Big repository can slow down the prompt rendering.

In order to ensure the `git` prompt updates without lag, you can add [fish-async-prompt](https://github.com/acomagu/fish-async-prompt) using `fisher`:

``` console
fisher install acomagu/fish-async-prompt
```

... and put this in your `config.fish`:

``` console
set -g async_prompt_functions _pure_prompt_git
```
