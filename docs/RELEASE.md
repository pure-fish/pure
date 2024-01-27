<!-- markdownlint-disable MD041 -->
## Releasing

Release process is automated in the pipeline with the following steps.

!!! info

    We follow [semver](https://semver.org/), release is manage in the pipeline

### Test

We run the test workflow on:

* Pull Request changing
  * any `**.fish` ;
  * and workflow (`*.yml`) files ;
* on `master` branch changing
  * `**.fish` files with the exception `conf.d/pure.fish`, as we have dedicated mechanism to manage versions bump ;
  * and workflow (`*.yml`) files

### Versioning

!!! success

    Commit messages must **[follow conventional commits convention][coco]**.

Versioning is done automatically based on commit messages and triggered only on `master` branch.

Details:

1. We compute the [project's next version][next-version] using a GitHub Action ;
2. Then update `$pure_version` value in `./conf.d/pure.fish` ;
3. Finally commit and [push the change][push] to the repo.

### Adding new tag

The `add-version-tag.yml` pipeline is triggered only for `master` when `./conf.d/pure.fish` is changed and add a tagged based on `$pure_version`.

[next-version]: https://github.com/thenativeweb/get-next-version
[push]: https://github.com/ad-m/github-push-action
<!-- markdownlint-disable-next-line MD053 -->
[coco]: https://www.conventionalcommits.org/en/v1.0.0/
