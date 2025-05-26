title:	v4.11.0: 📖 New Doc! ✨ AWS Profile Support and 🤖 tests on MacOS
tag:	v4.11.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2024-02-16T19:13:16Z
published:	2024-02-16T19:33:05Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.11.0
--
## What's Changed
* :book: docs/revamp documentation and automate screenshots by @edouard-lopez in https://github.com/pure-fish/pure/pull/343
* :sparkles: feat: AWS profile prompt by @kwigley in https://github.com/pure-fish/pure/pull/346
* :robot: ci: Pass tests under macOS by @hyperupcall in https://github.com/pure-fish/pure/pull/340

### :book:  New Documentation

- a better User eXperience (UX)
- a [dedicated site](https://pure-fish.github.io/pure/), 
- searchable content (thanks to [mkdocs](https://www.mkdocs.org/))
- screenshot of prompt with/without feature enabled (thanks to [terminal-screenshot](https://github.com/OmarTawfik/terminal-screenshot))
- a better organization for options
- linkable content you can share/bookmark

[![image](https://github.com/pure-fish/pure/assets/1212392/312759bd-302b-4282-a069-1c8d5455b669)](https://pure-fish.github.io/pure)

### :sparkles: rAWS Profile

| Option                              | Default | Description                                                                  |
| :---------------------------------- | :------ | :--------------------------------------------------------------------------- |
| **`pure_enable_aws_profile`**        | `true`  | Show AWS profile name (based on `AWS_VAULT` or `AWS_PROFILE`).       |
| **`pure_symbol_aws_profile_prefix`** |         | Prefix when a AWS profile is activated (default: [undefined][to-set]) |

| with a AWS Vault | with a AWS Profile
| --- | ---
![image](https://github.com/pure-fish/pure/assets/1212392/dc56bd07-c5d7-4ea8-b6de-fce6d1205d3f) | ![image](https://github.com/pure-fish/pure/assets/1212392/52e18913-8d0b-40bb-b8bc-8e342f95f406) |

### :robot: Test against MacOS in CI

We use `brew` to install Fish.

## New Contributors
* @hyperupcall made their first contribution in https://github.com/pure-fish/pure/pull/340

**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.10.1...v4.11.0
