#!/usr/bin/make -sf

# force use of Bash
SHELL := /bin/bash
INTERACTIVE=true


.PHONY: default
default: usage
usage:
	@printf "usage:"
	@printf "\tmake build-pure-on FISH_VERSION=3.3.1\t# build container\n"
	@printf "\tmake test-pure-on  FISH_VERSION=3.3.1\t# run tests\n"
	@printf "\tmake dev-pure-on   FISH_VERSION=3.3.1\t# dev in container\n"

.PHONY: build-pure-on
build-pure-on:
	docker build \
		--quiet \
		--file ./Dockerfile \
		--build-arg FISH_VERSION=${FISH_VERSION} \
		--tag=pure-on-fish-${FISH_VERSION} \
		./

.PHONY: dev-pure-on
dev-pure-on: CMD?=fish
dev-pure-on:
	chmod o=rwx tests/fixtures/ # for migration-to-4.0.0.test.fish only
	docker run \
		--name run-pure-on-${FISH_VERSION} \
		--rm \
		--interactive \
		--tty \
		--volume=$$(pwd):/tmp/.pure/ \
		pure-on-fish-${FISH_VERSION} "${CMD}"
	chmod o=r-x tests/fixtures/ # for migration-to-4.0.0.test.fish only

# Don't override COPY directive as `--volume` doesnt play nice with Travis
.PHONY: test-pure-on
test-pure-on: export CMD=fishtape tests/*.test.fish  # can be overriden by user
test-pure-on:
	docker run \
		--name run-pure-on-${FISH_VERSION} \
		--rm \
		--tty \
		pure-on-fish-${FISH_VERSION} "${CMD}"

.PHONY: release
release: VERSION="missing-version"
release:
	@if [[ -n "${VERSION}" ]] && [[ "${VERSION}" != 'missing-version' ]]; then \
		fish -c 'source ./tools/releaser.fish && releaser "${VERSION}"'; \
	else \
		printf "Error: Missing value, please provide a SemVer version number.\n"; \
	fi
