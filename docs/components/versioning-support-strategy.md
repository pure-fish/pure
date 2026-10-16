
[We decided](https://github.com/rafaelrinaldi/pure/issues/123) to restrict our support to the **major `Fish` versions only** (currently **`3.x` and `4.x`**).

This decision is based on the availability of those versions on LTS Ubuntu thanks to the official PPAs' for [Fish `3.x` PPA][fish-3-ppa] and [Fish `4.x`][fish-4-ppa] as well as on others [distributions repositories](https://pkgs.org/search/?q=%22friendly%20interactive%20shell%22).

As of October 2026, we are supporting:

* :tada: Supporting Fish `4.x` and above ;
* :tada: Supporting latest 2 versions of [major Linux distributions][supported-linux-distros] :

  | Distribution | Version | Supported |
  | :--- | :--- | :---: |
  | **Alpine** | see [docker-fish] | ✅ |
  | **Debian** | `13` _Trixie_ | ✅ |
  | &nbsp; | `12` _Bookworm_ | ✅ |
  | **Enterprise Linux¹** | `10` | ✅ |
  | &nbsp; | `9` | ✅ |
  | **Fedora** | `44` | ✅ |
  | &nbsp; | `43` | ✅ |
  | **Ubuntu LTS** | `26.04` _Resolute_ | ✅ |
  | &nbsp; | `24.04` _Noble_ | ✅ |

  | Distribution | Version | Supported |
  | :--- | :--- | :---: |
  | NixOS | `2.35.2` via [nixos/nix image][nixos-nix-docker] | ✅ |
  | MacOS | `latest` via [Homebrew][homebrew] | ✅ |

* :arrow_up: Set the minimal version to `3.6.x` as per [Debian 12][minimal-version] LTS [end-of-life policy][minimal-eol].
* :x: Dropping support for `3.3.x`

¹ Enterprise Linux includes _RHEL_, _Rocky Linux_, _AlmaLinux_, and _CentOS_.

### :earth_africa: Energy footprint

To **reduce our energy footprint**, we will only test:

* versions available [on latest Ubuntu LTS, MacOS and NixOS](https://repology.org/project/fish/versions) (see [availability](https://pkgs.org/download/fish)) ;
* [latest two versions of Fish](https://github.com/fish-shell/fish-shell/releases/).

[fish-4-ppa]: https://launchpad.net/~fish-shell/+archive/ubuntu/release-4
[fish-3-ppa]: https://launchpad.net/~fish-shell/+archive/ubuntu/release-3
[docker-fish]: https://github.com/pure-fish/docker-fish
[minimal-version]: https://pkgs.org/download/fish#
[minimal-eol]: https://endoflife.date/debian
[supported-linux-distros]: https://pkgs.org/download/fish#
[homebrew]: https://formulae.brew.sh/formula/fish
[nixos-nix-docker]: https://hub.docker.com/r/nixos/nix
