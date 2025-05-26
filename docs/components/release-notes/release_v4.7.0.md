title:	v4.7.0: Virtualenv feature flag and customization symbol
tag:	v4.7.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2023-08-21T21:56:35Z
published:	2023-08-22T08:39:19Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.7.0
--
## What's Changed
* feat(python): add feature flag to control virtualenv behavior by @edouard-lopez in https://github.com/pure-fish/pure/pull/325

## :snake: Add feature flag and customization symbol for Virtualenv

### Preview

> ![image](https://github.com/pure-fish/pure/assets/1212392/aff28920-790e-4072-9b7c-bf24221fde22)

### Configuration

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_symbol_virtualenv_prefix`**    |         | Prefix when a Python virtual env is activated (default: [undefined][to-set]) |
| **`pure_enable_virtualenv`**                             | `true`  | Show virtual env name (based on `VIRTUAL_ENV` or `CONDA_DEFAULT_ENV`).                                                                                              |


#### Default Behaviour: `true`

```shell
❯ set --universal pure_enable_virtualenv true
```

#### Feature Enable: `true`

```fish
❯ set --universal pure_enable_virtualenv true
❯ set --universal pure_symbol_virtualenv_prefix "🐍 "
```

Then activate a virtualenv or simulate one:
```fish
❯ set VIRTUAL_ENV /home/test/fake/project/ # simulate virtualenv
~/projects/contributions/pure master ≡
🐍 project ❯
```

> [pure_enable_virtualenv.webm](https://github.com/pure-fish/pure/assets/1212392/3c855767-596e-4576-a8e9-ef3746b93dd6)


### :arrow_down:  Installation

	fisher install pure-fish/pure

### :clap: Thanks

* @Sbozzolo for initiating the conversation #274
* @dwt for suggesting the emoji #291

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.6.4...v4.7.0

[to-set]: https://github.com/pure-fish/pure/#paintbrush-configuration
