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
build-pure-on: STAGE?=only-fish
build-pure-on:
	docker build \
		--quiet \
		--file ./docker/Dockerfile \
		--target ${STAGE} \
		--build-arg FISH_VERSION=${FISH_VERSION} \
		--tag=pure-${STAGE}-${FISH_VERSION} \
		./

.PHONY: dev-pure-on
dev-pure-on: CMD?=fish
dev-pure-on: STAGE?=with-pure-source
dev-pure-on:
	chmod o=rwx tests/fixtures/ # for migration-to-4.0.0.test.fish only
	docker run \
		--name dev-pure-on-${FISH_VERSION} \
		--rm \
		--interactive \
		--tty \
		--volume=$$(pwd):/home/nemo/.config/fish/pure/ \
		--workdir /home/nemo/.config/fish/pure/ \
		pure-${STAGE}-${FISH_VERSION} "${CMD}"
	chmod o=r-x tests/fixtures/ # for migration-to-4.0.0.test.fish only

.PHONY: test-pure-on
test-pure-on: CMD?=fishtape tests/*.test.fish
test-pure-on: STAGE?=with-pure-source
test-pure-on: build-with-pure-source
	docker run \
		--name test-pure-on-${FISH_VERSION} \
		--rm \
		--tty \
		pure-${STAGE}-${FISH_VERSION} "${CMD}"

.PHONY: build-with-pure-source
build-with-pure-source:
	$(MAKE) build-pure-on FISH_VERSION=${FISH_VERSION} STAGE=with-pure-source

.PHONY: dev-with-pure-installed
dev-with-pure-installed:
	$(MAKE) build-pure-on FISH_VERSION=${FISH_VERSION} STAGE=with-pure-installed
	$(MAKE) dev-pure-on FISH_VERSION=${FISH_VERSION} STAGE=with-pure-installed


build-pure-on-nix: STAGE?=nix
build-pure-on-nix:
	docker build \
		--file ./docker/${STAGE}.Dockerfile \
		--build-arg FISH_VERSION=${FISH_VERSION} \
		--tag=pure-${STAGE}-${FISH_VERSION} \
		./

dev-pure-on-nix: STAGE?=nix
dev-pure-on-nix: CMD?=fish
dev-pure-on-nix: TTY?=--tty
dev-pure-on-nix:
	chmod o=rwx ./tests/fixtures/ # for migration-to-4.0.0.test.fish only
	docker run \
		--name dev-pure-on-${FISH_VERSION} \
		--rm \
		--interactive \
		${TTY} \
		--volume=$$(pwd):/tmp/.pure/ \
		--workdir /tmp/.pure/ \
		pure-${STAGE}-${FISH_VERSION} "${CMD}"
	chmod o=r-x ./tests/fixtures/ # for migration-to-4.0.0.test.fish only

test-pure-on-nix: CMD?=fishtape tests/*.test.fish
test-pure-on-nix:
	$(MAKE) dev-pure-on-nix CMD="${CMD}" TTY=
