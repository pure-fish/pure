#!/usr/bin/make -sf

# force use of Bash
SHELL := /bin/bash
INTERACTIVE=true

.PHONY: build-pure-on
build-pure-on:
	docker build \
		--file ./tools/pure-on-fish.Dockerfile \
		--build-arg FISH_VERSION=${FISH_VERSION} \
		--tag=pure-on-fish-${FISH_VERSION} \
		./

.PHONY: test-on
test-on:
	docker run \
		--name test-pure-on-${FISH_VERSION} \
		--rm \
		--interactive \
		--tty \
		pure-on-fish-${FISH_VERSION} fish -c 'fishtape tests/{_pure,fish_,installer}*.test.fish'