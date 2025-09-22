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
