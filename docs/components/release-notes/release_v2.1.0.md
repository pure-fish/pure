title:	v2.1.0: VI mode prompt
tag:	v2.1.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2019-02-19T16:11:09Z
published:	2019-02-19T16:12:28Z
url:	https://github.com/pure-fish/pure/releases/tag/v2.1.0
--
Changes the default behaviour of the prompt in `vi` mode to use `❮` whenever the user is not in insert mode. This matches the behaviour of the `zsh` version of Pure:

![pure-vi-mode-support](https://user-images.githubusercontent.com/1212392/53028738-bbe2f580-3467-11e9-9b0f-1c08f4edb840.gif)
Toggling between mode using <kbd>Esc</kbd> and <kbd>i</kbd> key.

### Customization
We introduce a new variable to control the symbol for reverse prompt:
```fish
pure_symbol_reverse_prompt "❮"  # used for VI mode
```

And a flag to control the feature:
```fish
# VI mode indicator
# true (default):  indicate a non-insert mode by reversing the prompt symbol (❮)
# false:           indicate vi mode with [I], [N], [V]  
pure_reverse_prompt_symbol_in_vimode true
```

### Installation

    fisher add rafaelrinaldi/pure

### Thanks 

@codesections for his contribution :clap: #139 #140
