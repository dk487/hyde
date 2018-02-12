
ROOT := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

all: build test

build:
	jekyll build

test: build
	docker run -v $(ROOT)_site:/site 18fgsa/html-proofer /site

.PHONY: all build test
