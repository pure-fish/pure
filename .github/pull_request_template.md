**related:** fixes #xxx

## How to test pre-release?

> :skull_and_crossbones: Feature **can** be unstable and break your prompt!

```shell
fisher install pure-fish/pure@feat/foo_feature # branch name
set --universal pure_enable_foo_feature true
```

## First contribution?

Check the [:+1: contributing guide][contributing] for code and naming conventions.

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

* [ ] Documentation is up-to-date:
  * [ ] Add entry in _feature list_ of [README.md][README] ;
  * [ ] Add entry in _features' overview_ in [docs/][features-overview]  ;
  * [ ] Add section in [feature list][features-list] to document
    * [ ] Features' flag ;
    * [ ] Prompt symbol ;
* [ ] Default are defined in [`conf.d/pure.fish`][default] for:
  * [ ] Feature flag ;
  * [ ] Symbol ;
* [ ] Tests are passing (we can help you :hugs: ):
  * [ ] Config are tested (cf. [tests/_pure.test.fish][config-test]) ;
  * [ ] Feature is tested in `tests/feature_name.test.fish` ;
* [ ] Customization is available ;
* [ ] Feature is implemented.

[default]: /pure-fish/pure/blob/master/conf.d/pure.fish
[config-test]: /pure-fish/pure/blob/master/tests/_pure.test.fish
[contributing]: /pure-fish/pure/blob/master/CONTRIBUTING.md
[features-overview]: /pure-fish/pure/blob/master/docs/components/features-overview.md
[README]: /pure-fish/pure/blob/master/README.md
[features-list]: /pure-fish/pure/blob/master/docs/components/features-list.md
