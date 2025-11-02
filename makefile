#!/usr/bin/make -sf

# force use of Bash
SHELL := /usr/bin/env bash
INTERACTIVE=true


.PHONY: default
default: usage
usage:
	@printf "usage:"
	@printf "\tmake build-pure-on FISH_VERSION=3.3.1\t# build container\n"
	@printf "\tmake test-pure-on  FISH_VERSION=3.3.1\t# run tests\n"
	@printf "\tmake dev-pure-on   FISH_VERSION=3.3.1\t# dev in container\n"

.PHONY: build-pure-on
build-pure-on: STAGE?=with-pure-installed
build-pure-on:
	docker build \
		--file ./docker/Dockerfile \
		--target ${STAGE} \
		--build-arg FISH_VERSION=${FISH_VERSION} \
		--tag=pure-${STAGE}-${FISH_VERSION} \
		--load \
		./

.PHONY: dev-pure-on
dev-pure-on: CMD?=fish
dev-pure-on: STAGE?=with-pure-installed
dev-pure-on: TTY_FLAG?=$(shell [ -z "$$CI" ] && echo "--tty" || echo "")
dev-pure-on: USER_FLAG?=$(shell [ -z "$$CI" ] && echo "--user $$(id -u):$$(id -g)" || echo "")
dev-pure-on: build-with-pure-installed
	chmod o=rwx tests/fixtures/ # for migration-to-4.0.0.test.fish only
	docker run \
		--name dev-pure-on-${FISH_VERSION} \
		--rm \
		--interactive \
		$(TTY_FLAG) \
        $(USER_FLAG) \
        --env HOME=/home/nemo \
        --env XDG_CONFIG_HOME=/home/nemo/.config \
        --env XDG_DATA_HOME=/home/nemo/.local/share \
		--volume=$$(pwd):/home/nemo/.config/fish/pure/ \
		--workdir /home/nemo/.config/fish/pure/ \
		pure-${STAGE}-${FISH_VERSION} "fish --version && ${CMD}"
	chmod o=r-x tests/fixtures/ # for migration-to-4.0.0.test.fish only

.PHONY: test-pure-on
test-pure-on: CMD?=fishtape tests/*.test.fish
test-pure-on: STAGE?=with-pure-installed
test-pure-on: build-with-pure-installed
	docker run \
		--name test-pure-on-${FISH_VERSION} \
		--rm \
		--tty \
		pure-${STAGE}-${FISH_VERSION} "fish --version && ${CMD}"

.PHONY: build-with-pure-installed
build-with-pure-installed:
	$(MAKE) build-pure-on FISH_VERSION=${FISH_VERSION} STAGE=with-pure-installed

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
		--load \
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
		pure-${STAGE}-${FISH_VERSION} "fish --version && ${CMD}"
	chmod o=r-x ./tests/fixtures/ # for migration-to-4.0.0.test.fish only

test-pure-on-nix: CMD?=fishtape tests/*.test.fish
test-pure-on-nix:
	$(MAKE) dev-pure-on-nix CMD="${CMD}" TTY=


build-pure-doc:
	docker build \
		--file ./docker/doc.Dockerfile \
		--tag=pure-doc \
		--load \
		./

serve-pure-doc:
	docker run \
		--name mkdocs \
		--tty \
		--interactive \
		--rm \
		--publish 8000:8000 \
		--volume=$$(pwd):/docs \
		pure-doc


.PHONY: build-pure-screenshot
build-pure-screenshot:
	$(MAKE) build-pure-on FISH_VERSION=${FISH_VERSION} STAGE=with-terminal-screenshot-installed


.PHONY: run-pure-screenshot
run-pure-screenshot: CMD?=fishtape tools/screenshot.fish
run-pure-screenshot:
	mkdir --parents ./docs/assets/screenshots
	chmod a+rwx ./docs/assets/screenshots # because Github user `runner` is not `nemo` we have permissions issue
	rm --recursive --force ./docs/assets/screenshots/*.png
	$(MAKE) dev-pure-on FISH_VERSION=${FISH_VERSION} STAGE=with-terminal-screenshot-installed CMD="CI=true ${CMD}"