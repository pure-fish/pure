**related:** fixes #xxx

## How to test pre-release?

> :skull_and_crossbones: Feature **can** be unstable and break your prompt!

```shell
fisher install pure-fish/pure@feat/foo_feature # branch name
set --universal pure_enable_foo_feature true
```

## First contribution?

Check the [:+1: Contribute][contribute] section and the [contributing guide][contributing].

## Specs

### New config in `conf.d/pure.fish`

```fish
_pure_set_default pure_enable_foo_feature true
_pure_set_default pure_symbol_foo_feature "🤯"
```
<!-- remove if necessary -->

### Documentation

#### Usage

```shell
❯ set --universal pure_enable_feature_foo true
```

## Acceptance Checks

* [ ] documentation is up-to-date:
  * [ ] [features list][features] ;
  * [ ] [Prompt Symbol][symbol] ;
  * [ ] [🔌 Features' Flags][feature-flag] ;
* [ ] feature flag is present in `conf.d/pure.fish` ;
* [ ] symbol is present in `conf.d/pure.fish` ;
* [ ] tests are passing (I can help you :hugs: ):
  * [ ] config are tested (cf. [tests/_pure.test.fish][config-test]) ;
  * [ ] feature is covered ;
* [ ] customization is available ;
* [ ] feature is implemented.

[config-test]: tests/_pure.test.fish
[contribute]: /pure-fish/pure/#1-contribute
[contributing]: CONTRIBUTING.md
[feature-flag]: /pure-fish/pure/#-features-flags
[symbol]: /pure-fish/pure/#prompt-symbol
[features]: /pure-fish/pure/#features
