## Code of Conduct

* Be kind to others ;
* Critic code not people.

## Code Conventions for `pure`

### Public item

> Namespace your item with the prefix `pure_`.

* variable: `pure_my_variable`
* function: `pure_my_public_function`
* filename: `pure_my_public_file.fish`
* test file: `pure_my_public_file.test.fish`

### Private item

> Namespace your item with the prefix `_pure_` (begin with a single underscore).

* variable: `_pure_my_variable`
* function: `_pure_my_private_function`
* filename: `_pure_my_private_file.fish`
* test file: `_pure_my_private_file.test.fish`

### Local and Tools

> No need to use namespace when your variable variable is declare locally (`set --local`) or your file/test file is related to tooling (_installer.fish_, testing package managers install).

* filename: `my_tool.fish`
* test file: `my_tool.test.fish`

---

We will update if other cases arise.

If you are in favor of adding a `CONTRIBUTING.md`, upvote #100.
