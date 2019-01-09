#!/usr/bin/make -sf

# force use of Bash
SHELL := /bin/bash
INTERACTIVE=true

.PHONY: build-supported-versions
build-supported-versions:
	supported_version=( \
		2.4.0 \
		2.5.0 \
		2.6.0 \
		2.7.1 \
		3.0.0 \
	); for version in $${supported_version[@]}; do \
		$(MAKE) build-pure-on FISH_VERSION=$$version; \
	done

.PHONY: build-pure-on
build-pure-on:
	docker build \
		--file ./tools/pure-on-fish.Dockerfile \
		--build-arg FISH_VERSION=${FISH_VERSION} \
		--tag=pure-on-fish-${FISH_VERSION} \
		./

.PHONY: run-pure-on
run-pure-on:
	docker run \
		--name run-pure-on-${FISH_VERSION} \
		--rm \
		--interactive \
		--tty \
		pure-on-fish-${FISH_VERSION}

.PHONY: test-on
test-on:
	docker run \
		--name test-pure-on-${FISH_VERSION} \
		--rm \
		--interactive \
		--tty \
		pure-on-fish-${FISH_VERSION} fish -c 'fishtape tests/{_pure,fish_,installer}*.test.fish'