title:	v4.6.0: Kubernetes context and namespace, message warn missing requirement, pull request template
tag:	v4.6.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2023-08-16T10:15:31Z
published:	2023-08-16T12:23:10Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.6.0
--
## What's Changed
* feat/add kubernetes k8s support by @edouard-lopez in https://github.com/pure-fish/pure/pull/323
* [Pull request template][pr-template]
* **Full Changelog**: https://github.com/pure-fish/pure/compare/v4.5.0...v4.6.0

## :wheel_of_dharma: Kubernetes Context and Namespace

### Configuration

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_symbol_k8s_prefix`**           | `☸`     | Prefix when being connected to Kubernetes/K8s                       |
| **`pure_enable_k8s`**                                    | `false` | `true`: shows `kubernetes` context and namespace.                                                                                                                   |

#### Default Behaviour: `false`

```shell
❯ set --universal pure_enable_k8s false
~/projects/contributions/pure master ≡
```

#### Feature Enable: `true`

```shell
❯ set --universal pure_enable_k8s true
~/projects/contributions/pure master ≡ ☸ int-infra-eks-cluster-eu-west-3/qraft
```

## :bulb: Warning Message When Command Required by Feature is Missing

For now, this mechanism is only on the k8s feature, but that's something I would like to add to other features. 

[pure-k8s-feature.webm](https://github.com/pure-fish/pure/assets/1212392/a81bdc2f-8a18-401c-bff0-cb727f98aba7)

The detection behaviour is implemented in `_pure_check_availability` [function][code] & [tests][test] and it's used like:

```fish
_pure_check_availability <feature_name> <cmd>
```
Where `feature_name` is the feature that requires the command/function `cmd`

## Pull request template

Link to resources and how-tos to give contributors autonomy. See [.github/pull_request_template.md][pr-template] for full content.

### Preview

> ![pure-pull-request-template](https://github.com/pure-fish/pure/assets/1212392/bff97f39-cebe-42a3-9e75-f05a1cea2195)


### :arrow_down:  Installation

	fisher install pure-fish/pure

### :clap: Thanks

* @dwt for initiating the conversation #291

[pr-template]: https://github.com/pure-fish/pure/blob/596d0aa4c35355c77ad720ad52defa7dfcacd712/.github/pull_request_template.md
[code]: https://github.com/pure-fish/pure/blob/master/functions/_pure_check_availability.fish
[test]: https://github.com/pure-fish/pure/blob/master/tests/_pure_check_availability.test.fish
