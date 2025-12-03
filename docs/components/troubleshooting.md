### Customizing Fish Greeting

!!! info

    Since version `≥4.13.x`, `pure` does not override your `fish_greeting` function anymore, allowing you to use your own custom greeting.

To configure your Fish's greeting, edit `$__fish_config_dir/functions/fish_greeting.fish` function or the related variable:

=== "Check for new release"

    Add the following to call _pure_check_for_new_release_ on each new shell (i.e., when a new terminal session or `tmux` tab starts):

    ```fish
    function fish_greeting
        _pure_check_for_new_release
    end
    ```

=== "Void `fish_greeting` function"

    Voiding the _fish_greeting.fish_ function will stop printing any greeting:

    ```fish
    function fish_greeting
        # remove content to disable greeting
    end
    ```

=== "Empty `fish_greeting` variable"

    Or set the greeting to an empty string to stop printing any greeting:

    ```fish
    set --universal fish_greeting
    ```

### Install and Update

We do our best to clean up after ourselfves and provides information on the version installed or updated.

=== "Fresh Install"

    ![screenshot _pure_install](/pure/assets/screenshots/light-_pure_install.png#only-light)
    ![screenshot _pure_install](/pure/assets/screenshots/mirage-_pure_install.png#only-dark)

=== "Update"

    ![screenshot _pure_install](/pure/assets/screenshots/light-_pure_update.png#only-light)
    ![screenshot _pure_install](/pure/assets/screenshots/mirage-_pure_update.png#only-dark)

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
