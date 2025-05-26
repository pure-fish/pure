title:	v3.3.0: ⌛ Improve command duration, support subseconds with new flag
tag:	v3.3.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2020-12-11T11:08:55Z
published:	2020-12-11T11:18:47Z
url:	https://github.com/pure-fish/pure/releases/tag/v3.3.0
--
### :rocket: Add support for showing subsecond in command duration

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_show_subsecond_command_duration`**     | `false` | Show subsecond (ex. 1.5s) in command duration.                                                  

![feature-show-command-duration-subsecond](https://user-images.githubusercontent.com/1212392/101897122-57e47080-3baa-11eb-9772-646bce1f27fe.gif)

### :bug: Improve command duration, support subseconds with new flag

- Fix command duration rounding: Duration wasn't shown when:
    + When threshold = 5 (5000ms)
    + When process finished in [5000, 6000) milliseconds
- Fix command duration threshold: Duration wasn't shown when:
    + When threshold = 5 (5000ms)
    + When process finished in 1m4s (64 seconds)


### :arrow_down: Installation

    fisher install rafaelrinaldi/pure

### :clap: Thanks

* @NovaDev94 for his initial PR #213
