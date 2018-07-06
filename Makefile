
ROOT := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

all: build test

build:
	jekyll build

test: build
	docker run --rm -v $(ROOT)_site:/site 18fgsa/html-proofer /site \
		--check-html \
		--check-external-hash \
		--check-opengraph \
		--check-sri

.PHONY: all build test
