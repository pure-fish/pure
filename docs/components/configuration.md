<!-- markdownlint-disable MD041 -->
You can tweak `pure` behavior and color by changing [universal variables](https://fishshell.com/docs/current/tutorial.html#tut_universal) either directly in the terminal or in your `config.fish`, _e.g._:

```shell
# try to change prompt symbol
set --universal pure_symbol_prompt '>>>'
# restore default
set --universal pure_symbol_prompt '❯'
```
