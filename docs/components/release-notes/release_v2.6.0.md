title:	v2.6.0: Add flag to check for new release on startup
tag:	v2.6.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2020-11-19T12:38:01Z
published:	2020-11-19T12:38:54Z
url:	https://github.com/pure-fish/pure/releases/tag/v2.6.0
--
### :bell:  Flag to Check for new release on startup

![pure_check_for_new_release](https://user-images.githubusercontent.com/1212392/99608817-f39d1980-2a0e-11eb-8fd1-65cad4bd7342.gif)


As suggested by [@rafaelrinaldi in #123](https://github.com/rafaelrinaldi/pure/issues/123#issuecomment-453794127)
> I'd personally suggest current version and one prior and **print a warning for other users asking to upgrade**. It would be easier to maintain and ensure a better experience.


| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_check_for_new_release false`**         | `false`  | `true`: check repo for new release (on every shell start)

As this request can disrupt user workflow due to the HTTP request done to fetch information, **this feature is disable by default**. It's up to the user to decide if he want to enable it by editing your config.

### :arrow_down: Installation

    fisher install rafaelrinaldi/pure
