# AGENTS.md

* work in English

## Setup commands

* use `make` to build and test the project locally on different environments ;
* use `make` to test and build the documentation
* when executing tests, use the following commands to run in a isolated environment:

    make test-pure-on FISH_VERSION=(fish --version | string match --regex '(?:\\d+.?){3}') CMD="fishtape <files-to-test>"

## Code style

* Fish shell language ;
* KISS principles ;
* Avoid external dependencies where possible
* use commit conventions to generate changelogs and releases
* write tests for new features and bug fixes
* use [clean code principles](https://gist.github.com/wojteklu/73c6914cc446146b8b533c0988cf8d29#file-clean_code-md)
* follow [Pure code style guide](./CONTRIBUTING.md)

## Documentation

* when adding new features, update the documentation accordingly ;
* Generate concise and simple echo outputs to provide execution status
* document all public functions with `--description` ;
* when applicable, ask me if you need to add screenshots generation in `tools/screenshot.fish`. If so, add the screenshots to the documentation;