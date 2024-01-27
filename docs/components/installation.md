<!-- markdownlint-disable MD041 -->
!!! success

    Pure requires Fish **`≥3.x`**

=== "[Fisher](https://github.com/jorgebucaran/fisher)"

    ```shell
    fisher install pure-fish/pure
    ```

=== "Manually"

    1. Download the installer to `/tmp`
        ```shell
        curl git.io/pure-fish --output /tmp/pure_installer.fish --location --silent
        ```

    2. Source and trigger the installer
        ```
        source /tmp/pure_installer.fish; and install_pure
        ```
