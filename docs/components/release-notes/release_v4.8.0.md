title:	v4.8.0: NixOS support
tag:	v4.8.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2023-08-30T21:30:31Z
published:	2023-08-30T21:47:07Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.8.0
--
## What's Changed
* feat: add NixOs Dockerfile by @edouard-lopez in https://github.com/pure-fish/pure/pull/328

## NixOS Support

Some of the tests and test utils assumed they were ran by `$USER=nemo`. This is not the case in NixOS and probably other distros as well. We fixed the tests for NixOS, but there is still work to do ensure

## CI

### NixOS Job
We added a job to run the test again NixOS `2.17.0` using Fish `3.6.1` only

![image](https://github.com/pure-fish/pure/assets/1212392/a8a91f9b-9498-42a0-adbd-3b35ca4721b3)

### Dropping Versions Support

The following versions have been dropped, following our [Versions Support Strategy](https://github.com/pure-fish/pure/wiki/Versions-Support-Strategy)

```diff
- Fish: 3.0.2
- Fish: 3.1.2
- Fish: 3.2.2
- Fish: 3.3.1
```

## Mocks

We recently introduced a set of helpers functions to mock and spy system or pure's function. Here is a summary, but be sure to check the content of https://github.com/pure-fish/pure/tree/master/tests/mocks for implementation details.

### Mocking

* `_mock`: Mock a function using the mock in `tests/mocks/`
  * `function_name`: name of the method to mock
* `_mock_exit_status`: Mock a response exit status for a mock function
  * `function_name`: name of the method to mock
  * `status_code`: response to return
* `_mock_response`: Mock a response for a mock function
  * `function_name`: name of the method to mock
  * `response`: response to return
* `_clean_mock`: Clean a mock function  (warning: erase the function)
  * `function_name`: name of the method to mock

### Spying

* `_spy`: Create a spy method so, you can check it's been called with `_has_called`
  * `function_name`: name of the method to spy
* `_has_called`: check spy method has been called, i.e has written to the /tmp/$function_name.mock_calls
  * `function_name`: name of the that have been spied on
  * `function_args` # arguments to passed to the spy

### Cleaning

* `_clean_all_mocks`: Clean all mock functions created by `_mock`
* `_pure_unmock`: Restore a pure function by reloading its source
  * `function_name`: name of the method to mock
* `_clean_all_spy_calls`: Clean all spy calls created by `_spy`

### :arrow_down:  Installation

```sh
fisher update pure-fish/pure; or fisher install pure-fish/pure
```

### :clap: Thanks

* @pacien for spotting the issue, providing feedback about NixOS and his patience


**Full Changelog**: https://github.com/pure-fish/pure/compare/v4.7.1...v4.8.0

[to-set]: https://github.com/pure-fish/pure/#paintbrush-configuration
