title:	v4.0.0: 🏡 New Home
tag:	v4.0.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2021-02-17T21:12:13Z
published:	2022-05-20T11:46:09Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.0.0
--
## Being Human

### Home Mean You are Welcome

As you might have realized, @rafaelrinaldi [transferred the project](https://github.com/pure-fish/pure/issues/249) from his personal repository to https://github.com/pure-fish/pure/ organization.

The goals of this transfer are:
* To increase the [bus factor](https://www.wikiwand.com/en/Bus_factor) (@edouard-lopez, @rafaelrinaldi and @andreiborisov are owners now) ;
* Share permissions to update project settings more easily. 
* Onboard new contributors ;
* Configure template/metadata/open collective, etc.

It's also a way to reflect that the project evolved from a pet-project to a community project with almost ~900 :star: 

### 💓 Project Pulse

This is a long pending release note, you are probably using a more recent version (e.g. `4.1.1`). At the time of the transfer request I was pretty active maintaining the project, but by the time we achieve it I had other priorities pop-up 🧒👶.

Thus, I'm publishing this release note as I'm resuming contribution. 

New features and bugfixes will come in the coming weeks/months, [thanks to many contributors](https://github.com/pure-fish/pure/pulls?q=is%3Apr+sort%3Aupdated-desc+)! But before merging PRs, I will first focus on making the codebase stable and testable again by finishing the [migration to Fishtape 3](https://github.com/pure-fish/pure/pull/275).


## Release

> This major release break some variables related to `SSH` to introduce support for containers (`docker` and `lxc`).
Be sure to **read the Migration guide section carefully** :arrow_down: .

### Features

* [x] A new home and ownership for the project! #249 
* [x]  Show username@host if inside a container #241 

### Fixes

* [x] Migrates --quiet to -q #278 

### :arrow_down: Installation

The project has a new home, thanks to @rafaelrinaldi. It's now under `pure-fish` organization:

```diff
-fisher install rafaelrinaldi/pure
+fisher install pure-fish/pure
```

### :warning:  Breaking changes

* [x] remove official support for OMF and Fundle #248
* [x] Replace ~`_pure_prompt_ssh_host`~ by `_pure_user_at_host` to support container c074b08559 01a9b6a4a

## Migration Guide `v3.x` to `v4.0`

If you **customized your `pure`** using your `~/config.fish` you must update it by renaming some variables.

### :ambulance: Script

We provide [a migration script](tools/migration-to-4.0.0.fish) to help you with this tedious work:

    tools/migration-to-4.0.0.fish [/path/to/your/config.fish]

### Variables Renaming

#### :bomb: SSH Hostname Variable
```diff
-pure_color_ssh_hostname
+pure_color_hostname
```

#### :bomb: SSH At Sign (`@`) Variable
```diff
-pure_color_ssh_separator
+pure_color_at_sign
```

#### :bomb: SSH Normal Username Variable 
```diff
-pure_color_ssh_user_normal
+pure_color_username_normal
```

#### :bomb: SSH Root Username Variable 
```diff
-pure_color_ssh_user_root
+pure_color_username_root
```
