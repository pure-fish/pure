#!/usr/bin/make -sf

# force use of Bash
SHELL := /bin/bash
INTERACTIVE=true

build-pure-on:
	docker build \
		--file ./tools/pure-on-fish.Dockerfile \
		--build-arg FISH_VERSION=${FISH_VERSION} \
		--tag=pure-on-fish-${FISH_VERSION} \
		./
